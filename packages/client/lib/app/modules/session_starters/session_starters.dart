import 'package:flutter_modular/flutter_modular.dart';
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
export 'session_starters_logic.dart';

class SessionStartersModule extends Module {
  @override
  List<Module> get imports => [
        UserInformationModule(),
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

    i.add<SessionStarterCoordinator>(
      () => SessionStarterCoordinator(
        userInfo: Modular.get<UserInformationCoordinator>(),
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<SessionStarterWidgetsCoordinator>(),
      ),
    );
    i.add<SessionStarterEntryCoordinator>(
      () => SessionStarterEntryCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionStarterEntryWidgetsCoordinator>(),
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
      SessionStarterConstants.relativeSessionStarter,
      transition: TransitionType.noTransition,
      child: (context) => SessionStarterScreen(
        coordinator: Modular.get<SessionStarterCoordinator>(),
      ),
    );
  }
}
