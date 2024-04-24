// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/screens.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';
part 'irl_nokhte_session_exit_coordinator.g.dart';

class IrlNokhteSessionExitCoordinator = _IrlNokhteSessionExitCoordinatorBase
    with _$IrlNokhteSessionExitCoordinator;

abstract class _IrlNokhteSessionExitCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final IrlNokhteSessionExitWidgetsCoordinator widgets;
  final SwipeDetector swipe;
    final SessionPresenceCoordinator presence;
  final GetSessionMetadataStore sessionMetadata;
  final CleanUpCollaborationArtifactsCoordinator cleanUpCollaborationArtifacts;
  final DecidePhoneRole decidePhoneRoleLogic;

  _IrlNokhteSessionExitCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.presence,
    required this.cleanUpCollaborationArtifacts,
    required super.getUserInfo,
    required this.decidePhoneRoleLogic,
  }) : sessionMetadata = presence.getSessionMetadataStore;

  @observable
  bool showCollaboratorIncidents = true;

  @action
  setShowCollaboratorIncidents(bool newVal) =>
      showCollaboratorIncidents = newVal;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await decidePhoneRole();
    await presence.updateCurrentPhase(4.0);
    await captureScreen(Screens.nokhteSessionGreeter);
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
    if (presence.getSessionMetadataStore.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  @observable
  IrlNokhteSessionPhoneRole phoneRole = IrlNokhteSessionPhoneRole.initial;

  @action
  decidePhoneRole() async {
    final res = await decidePhoneRoleLogic(NoParams());
    res.fold((failure) => errorUpdater(failure),
        (assignedRole) => phoneRole = assignedRole);
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
      onReturnToTalkingComplete: () =>
          Modular.to.navigate('/irl_nokhte_session/speaking'),
    );
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
              await presence.updateCurrentPhase(3.5);
              setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });

  collaboratorPhaseReactor() => reaction(
        (p0) => presence.getSessionMetadataStore.collaboratorPhase,
        (p0) async {
          if (p0 == 3.5) {
            setIsGoingHome(true);
            await presence.updateCurrentPhase(3.5);
            widgets.onReadyToGoBack(phoneRole);
          }
        },
      );

  canReturnHomeReactor() => reaction(
        (p0) => presence.getSessionMetadataStore.canReturnHome,
        (p0) async {
          if (p0) {
            showCollaboratorIncidents = false;
            await presence.dispose();
            if (phoneRole == IrlNokhteSessionPhoneRole.talking) {
              await presence.completeTheSession();
            }
            Timer(Seconds.get(1), () async {
              await getUserInfo(NoParams());
            });
            widgets.onReadyToGoHome();
          }
        },
      );

  @computed
  String get pathIntoSession => phoneRole == IrlNokhteSessionPhoneRole.talking
      ? '/irl_nokhte_session/speaking'
      : '/irl_nokhte_session/notes';
}
