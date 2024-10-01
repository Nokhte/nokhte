import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/modules/user_metadata/user_metadata.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
import 'home.dart';
export 'constants/constants.dart';
export './needs_update/needs_update.dart';
export 'home/home.dart';
export 'root_router/root_router.dart';
export './quick_actions_router/quick_actions_router.dart';
export './home_entry/home_entry.dart';
export 'shared/mobx/mobx.dart';
export 'shared/shared.dart';
import 'home_widgets_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        HomeWidgetsModule(),
        SessionStartersLogicModule(),
        CleanUpCollaborationArtifactsModule(),
        UserInformationModule(),
        LegacyConnectivityModule(),
        PosthogModule(),
        StorageLogicModule(),
        UserMetadataModule()
      ];
  @override
  binds(i) {
    i.add<HomeScreenRootRouterCoordinator>(
      () => HomeScreenRootRouterCoordinator(
        cleanUpCollaborationArtifacts:
            Modular.get<CleanUpCollaborationArtifactsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        widgets: Modular.get<HomeScreenRootRouterWidgetsCoordinator>(),
      ),
    );
    i.add<QuickActionsRouterCoordinator>(
      () => QuickActionsRouterCoordinator(
        cleanUpCollaborationArtifacts:
            Modular.get<CleanUpCollaborationArtifactsCoordinator>(),
        widgets: Modular.get<QuickActionsRouterWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
      ),
    );

    i.add<HomeCoordinator>(
      () => HomeCoordinator(
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<HomeWidgetsCoordinator>(),
      ),
    );
    i.add<NeedsUpdateCoordinator>(
      () => NeedsUpdateCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<NeedsUpdateWidgetsCoordinator>(),
      ),
    );
    i.add<HomeEntryCoordinator>(
      () => HomeEntryCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<HomeEntryWidgetsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      HomeConstants.relativeRouter,
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenRootRouterScreen(
        coordinator: Modular.get<HomeScreenRootRouterCoordinator>(),
      ),
    );
    r.child(
      HomeConstants.relativeQuickActionsRouter,
      transition: TransitionType.noTransition,
      child: (context) => QuickActionsRouterScreen(
        coordinator: Modular.get<QuickActionsRouterCoordinator>(),
      ),
    );
    r.child(
      HomeConstants.relativeHome,
      transition: TransitionType.noTransition,
      child: (context) => HomeScreen(
        coordinator: Modular.get<HomeCoordinator>(),
      ),
    );
    r.child(
      HomeConstants.relativeEntry,
      transition: TransitionType.noTransition,
      child: (context) => HomeEntryScreen(
        coordinator: Modular.get<HomeEntryCoordinator>(),
      ),
    );
    r.child(
      HomeConstants.relativeNeedsToUpdate,
      transition: TransitionType.noTransition,
      child: (context) => NeedsUpdateScreen(
        coordinator: Modular.get<NeedsUpdateCoordinator>(),
      ),
    );
  }
}
