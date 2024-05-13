// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_exit_coordinator.g.dart';

class SessionExitCoordinator = _SessionExitCoordinatorBase
    with _$SessionExitCoordinator;

abstract class _SessionExitCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final SessionExitWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final SessionPresenceCoordinator presence;
  final ListenToSessionMetadataStore sessionMetadata;
  final CleanUpCollaborationArtifactsCoordinator cleanUpCollaborationArtifacts;

  _SessionExitCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.presence,
    required this.cleanUpCollaborationArtifacts,
    required super.getUserInfo,
  }) : sessionMetadata = presence.listenToSessionMetadataStore;

  @observable
  bool showCollaboratorIncidents = true;

  @observable
  bool phaseHasBeenSet = false;

  @action
  setShowCollaboratorIncidents(bool newVal) =>
      showCollaboratorIncidents = newVal;

  @action
  constructor() async {
    phaseHasBeenSet = false;
    widgets.constructor();
    initReactors();
    await presence.updateCurrentPhase(4.0);
    await captureScreen(Screens.nokhteSessionExit);
  }

  @observable
  bool isGoingHome = false;

  @action
  setIsGoingHome(bool newVal) => isGoingHome = newVal;

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

  @action
  initReactors() {
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    );
    presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    );
    widgets.beachWavesMovieStatusReactor(
        onToHomeComplete: onAnimationComplete,
        onReturnToTalkingComplete: () {
          if (phoneRole == SessionPhoneRole.speaking) {
            Modular.to.navigate(SessionConstants.speaking);
          }
        },
        onReturnToHybridComplete: () {
          Modular.to.navigate(SessionConstants.hybrid);
        });
    swipeReactor();
    collaboratorPhaseReactor();
    canReturnHomeReactor();
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            ifTouchIsNotDisabled(() async {
              await presence.updateCurrentPhase(5.0);
              widgets.onSwipeUp();
              setDisableAllTouchFeedback(true);
              Timer(Seconds.get(9), () async {
                if (!isGoingHome) {
                  await presence.updateCurrentPhase(4);
                  widgets.onNineSecondsLapsed();
                  setDisableAllTouchFeedback(false);
                }
              });
            });
          case GestureDirections.down:
            ifTouchIsNotDisabled(() async {
              if (!phaseHasBeenSet) {
                await presence.updateCurrentPhase(3.5);
                phaseHasBeenSet = true;
              }
              setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });

  collaboratorPhaseReactor() {
    reaction(
      (p0) => sessionMetadata.currentPhases,
      (p0) async {
        if (p0.contains(3.5)) {
          setIsGoingHome(true);
          if (!phaseHasBeenSet) {
            await presence.updateCurrentPhase(3.5);
            phaseHasBeenSet = true;
          }
          widgets.onReadyToGoBack(phoneRole);
        }
      },
    );
  }

  canReturnHomeReactor() => reaction(
        (p0) => sessionMetadata.canReturnHome,
        (p0) async {
          if (p0) {
            showCollaboratorIncidents = false;
            await presence.dispose();
            await presence.completeTheSession();
            Timer(Seconds.get(1), () async {
              await getUserInfo(NoParams());
            });
            widgets.onReadyToGoHome();
          }
        },
      );

  @computed
  SessionPhoneRole get phoneRole {
    if (sessionMetadata.numberOfCollaborators.isOdd) {
      if (sessionMetadata.userIndex == 0) {
        return SessionPhoneRole.hybrid;
      } else if (sessionMetadata.userIndex.isOdd) {
        return SessionPhoneRole.speaking;
      } else {
        return SessionPhoneRole.notes;
      }
    } else {
      if (sessionMetadata.userIndex.isEven) {
        return SessionPhoneRole.speaking;
      } else {
        return SessionPhoneRole.notes;
      }
    }
  }
}
