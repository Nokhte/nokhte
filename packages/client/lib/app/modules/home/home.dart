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
export 'has_session/has_session.dart';
export 'root_router/root_router.dart';
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

    i.add<QrAndStorageAdeptCoordinator>(
      () => QrAndStorageAdeptCoordinator(
        tap: TapDetector(),
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<QrAndStorageAdeptWidgetsCoordinator>(),
      ),
    );
    i.add<NeedsUpdateCoordinator>(
      () => NeedsUpdateCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<NeedsUpdateWidgetsCoordinator>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      HomeConstants.relativeRoot,
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenRootRouterScreen(
        coordinator: Modular.get<HomeScreenRootRouterCoordinator>(),
      ),
    );
    r.child(
      HomeConstants.relativeQrAndStorageAdept,
      transition: TransitionType.noTransition,
      child: (context) => QrAndStorageAdeptScreen(
        coordinator: Modular.get<QrAndStorageAdeptCoordinator>(),
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
