// ignore_for_file: must_be_immutable, library_private_types_in_public_api,
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte_backend/tables/company_presets.dart';
part 'session_exit_coordinator.g.dart';

class SessionExitCoordinator = _SessionExitCoordinatorBase
    with _$SessionExitCoordinator;

abstract class _SessionExitCoordinatorBase
    with
        Store,
        EnRoute,
        EnRouteRouter,
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
    initEnRouteActions();
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
    widgets.constructor(isNotASocraticSession);
    initReactors();
    setDisableAllTouchFeedback(true);
    await presence.updateCurrentPhase(4.0);
    sessionMetadata.setAffirmativePhase(4.0);
    disposers.add(
      userPhaseReactor(
        initWrapUp: () async => await onReturnHome(),
      ),
    );
    swipe.setMinDistance(100.0);
    await getUserInfo(NoParams());
    await captureScreen(SessionConstants.exit);
  }

  @observable
  bool isGoingHome = false;

  @action
  setIsGoingHome(bool newVal) => isGoingHome = newVal;

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
    disposers.add(widgets.beachWavesMovieStatusReactor(onToHomeComplete: () {
      if (getUserInfo.hasDoneASession) {
        Modular.to.navigate(HomeConstants.qrAndStorageAdept);
      } else {
        Modular.to.navigate(HomeConstants.storageGuide);
      }
    }, onReturnToTalkingComplete: () {
      if (phoneRole == SessionScreenTypes.speaking) {
        Modular.to.navigate(SessionConstants.speaking);
      } else {
        Modular.to.navigate(SessionConstants.soloHybrid);
      }
    }, onReturnToHybridComplete: () {
      Modular.to.navigate(SessionConstants.groupHybrid);
    }));
    if (isNotASocraticSession) {
      disposers.add(swipeReactor(onSwipeDown: () {
        widgets.onReadyToGoBack(phoneRole);
      }));
    }
  }

  @action
  onReturnHome() async {
    showCollaboratorIncidents = false;
    presence.dispose();
    if (sessionMetadata.userIndex == 0) {
      await presence.completeTheSession();
      await captureEnd(NoParams());
    }
    widgets.initHomeTransition();
  }

  @computed
  SessionScreenTypes get phoneRole => sessionMetadata.sessionScreenType;

  @computed
  bool get isNotASocraticSession =>
      sessionMetadata.presetType != PresetTypes.socratic;

  deconstructor() {
    presence.dispose();
    dispose();
  }
}
