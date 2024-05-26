// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'session_hybrid_widgets_coordinator.dart';
part 'session_hybrid_coordinator.g.dart';

class SessionHybridCoordinator = _SessionHybridCoordinatorBase
    with _$SessionHybridCoordinator;

abstract class _SessionHybridCoordinatorBase extends BaseCoordinator
    with Store {
  final SessionHybridWidgetsCoordinator widgets;
  final TapDetector tap;
  final SwipeDetector swipe;
  final HoldDetector hold;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final GyroscopicCoordinator gyroscopic;
  _SessionHybridCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.tap,
    required this.gyroscopic,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor(sessionMetadata.userCanSpeak);
    initReactors(sessionMetadata.shouldAdjustToFallbackExitProtocol);
    gyroscopic.listen(NoParams());
    setBlockPhoneTiltReactor(false);
    await captureScreen(SessionConstants.hybrid);
  }

  @observable
  bool blockPhoneTiltReactor = false;

  @action
  setBlockPhoneTiltReactor(bool newValue) => blockPhoneTiltReactor = newValue;

  initReactors(bool shouldAdjustToFallbackExitProtocol) {
    holdReactor();
    letGoReactor();
    widgets.wifiDisconnectOverlay.initReactors(
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
    );
    presence.initReactors(
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
    );
    if (shouldAdjustToFallbackExitProtocol) {
      swipeReactor();
    } else {
      phoneTiltStateReactor();
    }
    userPhaseReactor();
    collaboratorPhaseReactor();
    tapReactor();
    userIsSpeakingReactor();
    userCanSpeakReactor();
  }

  userIsSpeakingReactor() =>
      reaction((p0) => sessionMetadata.userIsSpeaking, (p0) async {
        if (p0) {
          setBlockPhoneTiltReactor(true);
          widgets.adjustSpeakLessSmileMoreRotation(hold.placement);
          widgets.onHold(hold.placement);
          setDisableAllTouchFeedback(true);
          await presence.updateCurrentPhase(2);
        }
      });

  userCanSpeakReactor() => reaction((p0) => sessionMetadata.userCanSpeak, (p0) {
        if (p0 && blockPhoneTiltReactor) {
          widgets.onLetGo();
          setBlockPhoneTiltReactor(false);
          Timer(Seconds.get(2), () {
            setDisableAllTouchFeedback(false);
          });
        } else if (p0 && !blockPhoneTiltReactor) {
          widgets.othersAreTalkingTint.reverseMovie(NoParams());
        } else if (!p0 && !blockPhoneTiltReactor) {
          widgets.othersAreTalkingTint.initMovie(NoParams());
        }
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.down:
            ifTouchIsNotDisabled(() async {
              await presence.updateCurrentPhase(3);
            });
          default:
            break;
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(
          () async {
            widgets.onTap(tap.currentTapPosition, onTap: () async {
              await presence.updateCurrentPhase(2);
            });
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

  phoneTiltStateReactor() =>
      reaction((p0) => gyroscopic.holdingState, (p0) async {
        if (!blockPhoneTiltReactor &&
            sessionMetadata.currentPhases
                .every((e) => e.isGreaterThanOrEqualTo(2))) {
          if (p0 == PhoneHoldingState.isPickedUp) {
            await presence.updateCurrentPhase(3);
          } else if (p0 == PhoneHoldingState.isDown) {
            await presence.updateCurrentPhase(2);
          }
        }
      });

  collaboratorPhaseReactor() => reaction(
        (p0) => sessionMetadata.currentPhases,
        (p0) async {
          if (sessionMetadata.canExitTheSession) {
            await gyroscopic.dispose();
            widgets.onExit();
            setBlockPhoneTiltReactor(true);
          }
        },
      );

  userPhaseReactor() => reaction(
        (p0) => sessionMetadata.userPhase,
        (p0) async {
          if (sessionMetadata.canExitTheSession) {
            await gyroscopic.dispose();
            widgets.onExit();
            setBlockPhoneTiltReactor(true);
          }
        },
      );

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
}
