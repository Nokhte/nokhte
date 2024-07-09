import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_starters.dart';
export 'constants/constants.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';
export 'session_starters_widgets.dart';
export 'types/types.dart';
export './widgets/widgets.dart';
export 'session_starters_logic.dart';

class SessionStartersModule extends Module {
  @override
  List<Module> get imports => [
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        SessionStartersLogicModule(),
        PosthogModule(),
        SessionStartersWidgetsModule(),
      ];

  @override
  void binds(i) {
    i.add<SessionJoinerCoordinator>(
      () => SessionJoinerCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<SessionJoinerWidgetsCoordinator>(),
      ),
    );
    i.add<SessionJoinerInstructionsCoordinator>(
      () => SessionJoinerInstructionsCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<SessionJoinerInstructionsWidgetsCoordinator>(),
      ),
    );

    i.add<SessionInstructionsPickerCoordinator>(
      () => SessionInstructionsPickerCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionInstructionsPickerWidgetsCoordinator>(),
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
        userInfo: Modular.get<UserInformationCoordinator>(),
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
      SessionStarterConstants.relativeSessionInstructionsPicker,
      transition: TransitionType.noTransition,
      child: (context) => SessionInstructionsPickerScreen(
        coordinator: Modular.get<SessionInstructionsPickerCoordinator>(),
      ),
    );
    r.child(
      SessionStarterConstants.relativeSessionJoinerInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionJoinerInstructionsScreen(
        coordinator: Modular.get<SessionJoinerInstructionsCoordinator>(),
      ),
    );

    r.child(
      SessionStarterConstants.relativeSessionJoiner,
      transition: TransitionType.noTransition,
      child: (context) => SessionJoinerScreen(
        coordinator: Modular.get<SessionJoinerCoordinator>(),
      ),
    );

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
  }
}
