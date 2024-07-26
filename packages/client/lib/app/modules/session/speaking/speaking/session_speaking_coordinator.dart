// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/_real_time_disabled/company_presets/queries.dart';
part 'session_speaking_coordinator.g.dart';

class SessionSpeakingCoordinator = _SessionSpeakingCoordinatorBase
    with _$SessionSpeakingCoordinator;

abstract class _SessionSpeakingCoordinatorBase
    with Store, BaseCoordinator, Reactions, SessionPresence {
  final SessionSpeakingWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final SessionMetadataStore sessionMetadata;
  @override
  final SessionPresenceCoordinator presence;
  @override
  final CaptureScreen captureScreen;
  _SessionSpeakingCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.presence,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
  }

  @action
  constructor() async {
    widgets.constructor(sessionMetadata.userCanSpeak);
    swipe.setMinDistance(100.0);
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
              widgets.onExit(
                isASocraticSession:
                    sessionMetadata.presetType == PresetTypes.socratic,
              );
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
          if (sessionMetadata.everyoneIsOnline &&
              sessionMetadata.canStartUsingSession) {
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

  deconstructor() {
    dispose();
    widgets.dispose();
  }
}
