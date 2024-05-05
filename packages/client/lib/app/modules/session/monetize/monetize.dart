export 'session_paywall/session_paywall.dart';
export 'waiting_patron/waiting_patron.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/monetize/session_paywall/session_paywall.dart';
import 'package:nokhte/app/modules/session/monetize/waiting_patron/waiting_patron.dart';

class SessionMonetizeModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
        PosthogModule(),
        UserInformationModule(),
      ];

  @override
  void binds(i) {
    i.add<SessionPaywallCoordinator>(
      () => SessionPaywallCoordinator(
        getUserInfo: Modular.get<GetUserInfoStore>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionPaywallWidgetsCoordinator>(),
        tap: TapDetector(),
        swipe: SwipeDetector(),
      ),
    );
    i.add<WaitingPatronCoordinator>(
      () => WaitingPatronCoordinator(
        getUserInfo: Modular.get<GetUserInfoStore>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<WaitingPatronWidgetsCoordinator>(),
        tap: TapDetector(),
        swipe: SwipeDetector(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      transition: TransitionType.noTransition,
      '/paywall',
      child: (context) => SessionPaywallScreen(
        coordinator: Modular.get<SessionPaywallCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/waiting_patron',
      child: (context) => WaitingPatronScreen(
        coordinator: Modular.get<WaitingPatronCoordinator>(),
      ),
    );
  }
}
