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
  final ListenToSessionMetadataStore sessionMetadata;
  final GyroscopicCoordinator gyroscopic;
  _SessionSpeakingCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.hold,
    required this.gyroscopic,
    required this.presence,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @action
  constructor() async {
    widgets.constructor();
    initReactors(sessionMetadata.shouldAdjustToFallbackExitProtocol);
    gyroscopic.listen(NoParams());
    setBlockPhoneTiltReactor(false);
    await captureScreen(SessionConstants.speaking);
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
      onDisconnected: () async {
        setDisableAllTouchFeedback(true);
        if (sessionMetadata.userIsSpeaking) {
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
        }
      },
    );
    presence.initReactors(
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
    );
    if (shouldAdjustToFallbackExitProtocol) {
      swipeReactor();
    } else {
      phoneTiltStateReactor();
    }
    userPhaseReactor();
    collaboratorPhaseReactor();
    userIsSpeakingReactor();
    userCanSpeakReactor();
  }

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
          widgets.tint.reverseMovie(NoParams());
        } else if (!p0 && !blockPhoneTiltReactor) {
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
}
