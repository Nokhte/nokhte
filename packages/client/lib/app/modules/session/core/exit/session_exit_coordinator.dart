// ignore_for_file: must_be_immutable, library_private_types_in_public_api,
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_exit_coordinator.g.dart';

class SessionExitCoordinator = _SessionExitCoordinatorBase
    with _$SessionExitCoordinator;

abstract class _SessionExitCoordinatorBase
    with
        Store,
        HomeScreenRouter,
        BaseCoordinator,
        Reactions,
        SessionPresence,
        BaseExitCoordinator {
  final SessionExitWidgetsCoordinator widgets;
  @override
  final SwipeDetector swipe;
  @override
  final SessionMetadataStore sessionMetadata;
  final CleanUpCollaborationArtifactsCoordinator cleanUpCollaborationArtifacts;
  final CaptureNokhteSessionEnd captureEnd;
  @override
  final SessionPresenceCoordinator presence;
  @override
  final CaptureScreen captureScreen;
  @override
  final GetUserInfoStore getUserInfo;

  _SessionExitCoordinatorBase({
    required this.captureScreen,
    required this.widgets,
    required this.swipe,
    required this.captureEnd,
    required this.presence,
    required this.cleanUpCollaborationArtifacts,
    required this.getUserInfo,
  }) : sessionMetadata = presence.sessionMetadataStore {
    initBaseCoordinatorActions();
    initBaseExitCoordinatorActions();
  }

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
    sessionMetadata.setAffirmativePhase(4.0);
    await captureScreen(SessionConstants.exit);
  }

  @observable
  bool isGoingHome = false;

  @action
  setIsGoingHome(bool newVal) => isGoingHome = newVal;

  // @observable
  // bool blockUserPhaseReactor = false;

  // @action
  // setBlockUserPhaseReactor(bool newVal) => blockUserPhaseReactor = newVal;

  @action
  initReactors() {
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    ));
    disposers.add(presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
        widgets.onCollaboratorJoined();
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
        widgets.onCollaboratorLeft();
      },
    ));
    disposers.add(widgets.beachWavesMovieStatusReactor(
        onToHomeComplete: onAnimationComplete,
        onReturnToTalkingComplete: () {
          if (phoneRole == SessionScreenTypes.speaking) {
            Modular.to.navigate(SessionConstants.speaking);
          }
        },
        onReturnToHybridComplete: () {
          Modular.to.navigate(SessionConstants.groupHybrid);
        }));
    disposers.add(
        swipeReactor(onSwipeDown: () => widgets.onReadyToGoBack(phoneRole)));
    disposers.add(
      userPhaseReactor(
        initShowStatus: () => widgets.initStartingMovie(
          totalAffirmative: sessionMetadata.numberOfAffirmative,
          totalNumberOfCollaborators: sessionMetadata.numberOfCollaborators,
        ),
        initWrapUp: () async => await onReturnHome(),
      ),
    );
    disposers.add(
      widgets.sessionExitStatusCompletionReactor(
        onInitialized: () async {
          if (sessionMetadata.userPhase == -1.0) {
            setBlockUserPhaseReactor(true);
            widgets.onNumOfAffirmativeChanged(
              totalNumberOfCollaborators: widgets.totalNumberOfCollaborators,
              totalAffirmative: widgets.totalNumberOfCollaborators,
            );
          } else {
            disposers.add(
              numberOfAffirmativeReactor(
                onInit: widgets.onNumOfAffirmativeChanged,
                onComplete: () {
                  setShowCollaboratorIncidents(false);
                },
              ),
            );
          }
        },
        onReadyToGoHome: () async => await onReturnHome(),
      ),
    );
  }

  @action
  onReturnHome() async {
    showCollaboratorIncidents = false;
    presence.dispose();
    if (sessionMetadata.userIndex == 0) {
      await presence.completeTheSession();
      await captureEnd(NoParams());
    }
    Timer(Seconds.get(1), () async {
      await getUserInfo(NoParams());
    });
    widgets.initHomeTransition();
  }

  @computed
  SessionScreenTypes get phoneRole => sessionMetadata.sessionScreenType;

  deconstructor() {
    dispose();
  }
}
