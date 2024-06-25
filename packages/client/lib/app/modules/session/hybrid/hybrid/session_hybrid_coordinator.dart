// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'session_hybrid_widgets_coordinator.dart';
part 'session_hybrid_coordinator.g.dart';

class SessionHybridCoordinator = _SessionHybridCoordinatorBase
    with _$SessionHybridCoordinator;

abstract class _SessionHybridCoordinatorBase
    with Store, BaseCoordinator, Disposer {
  final SessionHybridWidgetsCoordinator widgets;
  final TapDetector tap;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final SessionPresenceCoordinator presence;
  final SessionMetadataStore sessionMetadata;
  final CaptureScreen captureScreen;

  _SessionHybridCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.tap,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor(sessionMetadata.userCanSpeak);
    initReactors();
    await presence.updateCurrentPhase(2.0);
    await captureScreen(SessionConstants.hybrid);
  }

  @observable
  bool userIsSpeaking = false;

  @action
  setUserIsSpeaking(bool newValue) => userIsSpeaking = newValue;

  initReactors() {
    disposers.add(holdReactor());
    disposers.add(letGoReactor());
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        if (hold.holdCount.isGreaterThan(hold.letGoCount)) {
          widgets.onLetGo();
        }
      },
    ));
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        if (hold.holdCount.isGreaterThan(hold.letGoCount)) {
          widgets.onLetGo();
        }
        widgets.onCollaboratorLeft();
      },
    ));
    disposers.add(swipeReactor());
    disposers.add(tapReactor());
    disposers.add(userIsSpeakingReactor());
    disposers.add(userCanSpeakReactor());
  }

  userIsSpeakingReactor() =>
      reaction((p0) => sessionMetadata.userIsSpeaking, (p0) async {
        if (p0) {
          setUserIsSpeaking(true);
          widgets.adjustSpeakLessSmileMoreRotation(hold.placement);
          widgets.onHold(hold.placement);
          setDisableAllTouchFeedback(true);
          await presence.updateCurrentPhase(2);
        }
      });

  userCanSpeakReactor() => reaction((p0) => sessionMetadata.userCanSpeak, (p0) {
        if (p0 && userIsSpeaking) {
          widgets.onLetGo();
          setUserIsSpeaking(false);
          Timer(Seconds.get(2), () {
            setDisableAllTouchFeedback(false);
          });
        } else if (p0 && !userIsSpeaking) {
          widgets.othersAreTalkingTint.reverseMovie(NoParams());
        } else if (!p0 && !userIsSpeaking) {
          widgets.othersAreTalkingTint.initMovie(NoParams());
        }
      });

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

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () async {
            widgets.onTap(tap.currentTapPosition);
          },
        ),
      );

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
