import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts_module.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'package:nokhte/app/modules/storage/storage_logic_module.dart';
import 'home_widgets_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        HomeWidgetsModule(),
        GesturesModule(),
        CollaborationLogicModule(),
        CleanUpCollaborationArtifactsModule(),
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        PosthogModule(),
        StorageLogicModule(),
      ];
  @override
  binds(i) {
    i.add<HomeScreenPhase0Coordinator>(
      () => HomeScreenPhase0Coordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        identifyUser: Modular.get<IdentifyUser>(),
        cleanUpCollaborationArtifacts:
            Modular.get<CleanUpCollaborationArtifactsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        widgets: Modular.get<HomeScreenPhase0WidgetsCoordinator>(),
      ),
    );
    i.add<HomeScreenPhase1Coordinator>(
      () => HomeScreenPhase1Coordinator(
        tap: TapDetector(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<HomeScreenPhase1WidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<HomeScreenPhase2Coordinator>(
      () => HomeScreenPhase2Coordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<HomeScreenPhase2WidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<HomeScreenPhase3Coordinator>(
      () => HomeScreenPhase3Coordinator(
        tap: TapDetector(),
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<HomeScreenPhase3WidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        userInformation: Modular.get<UserInformationCoordinator>(),
      ),
    );
    i.add<HomeScreenPhase4Coordinator>(
      () => HomeScreenPhase4Coordinator(
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        tap: TapDetector(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<HomeScreenPhase4WidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<HomeScreenPhase5Coordinator>(
      () => HomeScreenPhase5Coordinator(
        tap: TapDetector(),
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<HomeScreenPhase5WidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      "/",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenPhase0RootDecider(
        coordinator: Modular.get<HomeScreenPhase0Coordinator>(),
      ),
    );
    r.child(
      "/phase1",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenPhase1NoInvitationFlowNoSession(
        coordinator: Modular.get<HomeScreenPhase1Coordinator>(),
      ),
    );
    r.child(
      "/phase2",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenPhase2DoneInvitationFlowNoSession(
        coordinator: Modular.get<HomeScreenPhase2Coordinator>(),
      ),
    );
    r.child(
      "/phase3",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenPhase3HasDoneSession(
        coordinator: Modular.get<HomeScreenPhase3Coordinator>(),
      ),
    );
    r.child(
      "/phase4",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenPhase4HasGoneIntoStorage(
        coordinator: Modular.get<HomeScreenPhase4Coordinator>(),
      ),
    );
    r.child(
      "/phase5",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenPhase5HasGoneIntoStorageNoInvitationFlow(
        coordinator: Modular.get<HomeScreenPhase5Coordinator>(),
      ),
    );
  }
}
