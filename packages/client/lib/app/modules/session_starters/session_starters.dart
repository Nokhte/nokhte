import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_starters.dart';
export 'constants/constants.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';
export 'session_starters_widgets.dart';
export 'session_starters_logic.dart';

class SessionStartersModule extends Module {
  @override
  List<Module> get imports => [
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        SessionStartersLogicModule(),
        PosthogModule(),
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
        SessionStartersWidgetsModule(),
      ];

  @override
  void binds(i) {
    i.add<PresetsCoordinator>(
      () => PresetsCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<PresetsWidgetsCoordinator>(),
      ),
    );
    i.add<PresetsInstructionsCoordinator>(
      () => PresetsInstructionsCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<PresetsInstructionsWidgetsCoordinator>(),
      ),
    );
    i.add<SessionStarterInstructionsCoordinator>(
      () => SessionStarterInstructionsCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<SessionStarterInstructionsWidgetsCoordinator>(),
      ),
    );
    i.add<SessionStarterCoordinator>(
      () => SessionStarterCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        widgets: Modular.get<SessionStarterWidgetsCoordinator>(),
      ),
    );
    i.add<SessionStarterEntryCoordinator>(
      () => SessionStarterEntryCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionStarterEntryWidgetsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
      ),
    );
    i.add<SessionStarterExitCoordinator>(
      () => SessionStarterExitCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionStarterExitWidgetsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      SessionStarterConstants.relativeSessionStarterEntry,
      transition: TransitionType.noTransition,
      child: (context) => SessionStarterEntryScreen(
        coordinator: Modular.get<SessionStarterEntryCoordinator>(),
      ),
    );
    r.child(
      SessionStarterConstants.relativeSessionStarterExit,
      transition: TransitionType.noTransition,
      child: (context) => SessionStarterExitScreen(
        coordinator: Modular.get<SessionStarterExitCoordinator>(),
      ),
    );
    r.child(
      SessionStarterConstants.relativeSessionStarter,
      transition: TransitionType.noTransition,
      child: (context) => SessionStarterScreen(
        coordinator: Modular.get<SessionStarterCoordinator>(),
      ),
    );
    r.child(
      SessionStarterConstants.relativeSessionStarterInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionStarterInstructionsScreen(
        coordinator: Modular.get<SessionStarterInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionStarterConstants.relativePresets,
      transition: TransitionType.noTransition,
      child: (context) => PresetsScreen(
        coordinator: Modular.get<PresetsCoordinator>(),
      ),
    );
    r.child(
      SessionStarterConstants.relativePresetsInstructions,
      transition: TransitionType.noTransition,
      child: (context) => PresetsInstructionsScreen(
        coordinator: Modular.get<PresetsInstructionsCoordinator>(),
      ),
    );
  }
}
