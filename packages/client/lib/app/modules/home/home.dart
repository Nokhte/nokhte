import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
import 'home.dart';
export 'mobx/mobx.dart';
export 'screens/screens.dart';
import 'home_widgets_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        HomeWidgetsModule(),
        SessionStartersLogicModule(),
        CleanUpCollaborationArtifactsModule(),
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        PosthogModule(),
        StorageLogicModule(),
      ];
  @override
  binds(i) {
    i.add<HomeScreenRootRouterCoordinator>(
      () => HomeScreenRootRouterCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        identifyUser: Modular.get<IdentifyUser>(),
        cleanUpCollaborationArtifacts:
            Modular.get<CleanUpCollaborationArtifactsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        sessionStarters: Modular.get<SessionStartersLogicCoordinator>(),
        widgets: Modular.get<HomeScreenRootRouterWidgetsCoordinator>(),
      ),
    );
    i.add<CompassAndQrGuideCoordinator>(
      () => CompassAndQrGuideCoordinator(
        userInformation: Modular.get<UserInformationCoordinator>(),
        tap: TapDetector(),
        sessionStarters: Modular.get<SessionStartersLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<CompassAndQrGuideWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<QrNavigationReminderCoordinator>(
      () => QrNavigationReminderCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        sessionStarters: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<QrNavigationReminderWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<StorageGuideCoordinator>(
      () => StorageGuideCoordinator(
        tap: TapDetector(),
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        sessionStarters: Modular.get<SessionStartersLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<StorageGuideWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        userInformation: Modular.get<UserInformationCoordinator>(),
      ),
    );
    i.add<CompassAndStorageGuideCoordinator>(
      () => CompassAndStorageGuideCoordinator(
        tap: TapDetector(),
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        sessionStarters: Modular.get<SessionStartersLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<CompassAndStorageGuideWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        userInformation: Modular.get<UserInformationCoordinator>(),
      ),
    );
    i.add<ShortQrGuideCoordinator>(
      () => ShortQrGuideCoordinator(
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        tap: TapDetector(),
        sessionStarters: Modular.get<SessionStartersLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<ShortQrGuideWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<QrAndStorageAdeptCoordinator>(
      () => QrAndStorageAdeptCoordinator(
        tap: TapDetector(),
        getNokhteSessionArtifactsLogic:
            Modular.get<GetNokhteSessionArtifacts>(),
        sessionStarters: Modular.get<SessionStartersLogicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<QrAndStorageAdeptWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      "/",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreenRootRouterScreen(
        coordinator: Modular.get<HomeScreenRootRouterCoordinator>(),
      ),
    );
    r.child(
      "/compass_and_qr_guide",
      transition: TransitionType.noTransition,
      child: (context) => CompassAndQrGuideScreen(
        coordinator: Modular.get<CompassAndQrGuideCoordinator>(),
      ),
    );
    r.child(
      "/qr_navigation_reminder",
      transition: TransitionType.noTransition,
      child: (context) => QrNavigationReminderScreen(
        coordinator: Modular.get<QrNavigationReminderCoordinator>(),
      ),
    );
    r.child(
      "/compass_and_storage_guide",
      transition: TransitionType.noTransition,
      child: (context) => CompassAndStorageGuideScreen(
        coordinator: Modular.get<CompassAndStorageGuideCoordinator>(),
      ),
    );
    r.child(
      "/storage_guide",
      transition: TransitionType.noTransition,
      child: (context) => StorageGuideScreen(
        coordinator: Modular.get<StorageGuideCoordinator>(),
      ),
    );
    r.child(
      "/short_qr_guide",
      transition: TransitionType.noTransition,
      child: (context) => ShortQrGuideScreen(
        coordinator: Modular.get<ShortQrGuideCoordinator>(),
      ),
    );
    r.child(
      "/qr_and_storage_adept",
      transition: TransitionType.noTransition,
      child: (context) => QrAndStorageAdeptScreen(
        coordinator: Modular.get<QrAndStorageAdeptCoordinator>(),
      ),
    );
  }
}
