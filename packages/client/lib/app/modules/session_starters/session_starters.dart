import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_starters.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';
export 'session_starters_widgets.dart';
export 'session_starters_logic.dart';

class SessionStartersModule extends Module {
  @override
  List<Module> get imports => [
        SessionStartersWidgetsModule(),
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        SessionStartersLogicModule(),
        PosthogModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<SessionStarterCoordinator>(
      () => SessionStarterCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        captureShareNokhteSessionInvitation:
            Modular.get<CaptureShareNokhteSessionInvitation>(),
        logic: Modular.get<SessionStartersLogicCoordinator>(),
        swipe: SwipeDetector(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        widgets: Modular.get<SessionStarterWidgetsCoordinator>(),
        userInformation: i<UserInformationCoordinator>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => SessionStarterScreen(
        coordinator: Modular.get<SessionStarterCoordinator>(),
      ),
    );
  }
}
