// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'session_speaking_widgets_coordinator.dart';
part 'session_speaking_coordinator.g.dart';

class SessionSpeakingCoordinator = _SessionSpeakingCoordinatorBase
    with _$SessionSpeakingCoordinator;

abstract class _SessionSpeakingCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionSpeakingWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  _SessionSpeakingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    await presence.updateCurrentPhase(2.0);
    initReactors();
    await captureScreen(SessionConstants.speaking);
  }

  initReactors() {
    disposers.add(holdReactor());
    disposers.add(letGoReactor());
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () async {
        setDisableAllTouchFeedback(true);
        if (sessionMetadata.userIsSpeaking) {
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
        }
      },
    ));
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () async {
        setDisableAllTouchFeedback(true);
        if (sessionMetadata.userIsSpeaking) {
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
        }
        widgets.onCollaboratorLeft();
      },
    ));
    disposers.add(swipeReactor());
    disposers.add(userIsSpeakingReactor());
    disposers.add(userCanSpeakReactor());
  }

  @observable
  bool userIsTalking = false;

  @action
  setUserIsTalking(bool newValue) => userIsTalking = newValue;

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.down:
            ifTouchIsNotDisabled(() {
              widgets.onExit();
            });
          default:
            break;
        }
      });

  userIsSpeakingReactor() =>
      reaction((p0) => sessionMetadata.userIsSpeaking, (p0) async {
        if (p0) {
          setUserIsTalking(true);
          widgets.adjustSpeakLessSmileMoreRotation(hold.placement);
          widgets.onHold(hold.placement);
          setDisableAllTouchFeedback(true);
          await presence.updateCurrentPhase(2);
        }
      });

  userCanSpeakReactor() => reaction((p0) => sessionMetadata.userCanSpeak, (p0) {
        if (p0 && userIsTalking) {
          widgets.onLetGo();
          setUserIsTalking(false);
          Timer(Seconds.get(2), () {
            setDisableAllTouchFeedback(false);
          });
        } else if (p0 && !userIsTalking) {
          widgets.tint.reverseMovie(NoParams());
        } else if (!p0 && !userIsTalking) {
          widgets.tint.initMovie(NoParams());
        }
      });

  holdReactor() => reaction((p0) => hold.holdCount, (p0) {
        ifTouchIsNotDisabled(() async {
          if (sessionMetadata.everyoneIsOnline) {
            await presence
                .updateWhoIsTalking(UpdateWhoIsTalkingParams.setUserAsTalker);
          }
        });
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) async {
        if (sessionMetadata.everyoneIsOnline) {
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
        }
      });

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
    if (sessionMetadata.userIsSpeaking) {
      await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
    }
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (sessionMetadata.everyoneIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  @override
  deconstructor() {
    widgets.deconstructor();
    super.deconstructor();
  }
}
