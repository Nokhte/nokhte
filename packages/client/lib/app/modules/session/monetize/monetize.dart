export 'session_paywall/session_paywall.dart';
export 'waiting_patron/waiting_patron.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/in_app_purchase.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/monetize/session_paywall/session_paywall.dart';
import 'package:nokhte/app/modules/session/monetize/waiting_patron/waiting_patron.dart';
import 'package:nokhte/app/modules/session/session.dart';

class SessionMonetizeModule extends Module {
  @override
  List<Module> get imports => [
        ConnectivityModule(),
        GestureCrossModule(),
        PosthogModule(),
        UserInformationModule(),
        InAppPurchaseModule(),
        ActiveMonetizationSessionModule(),
        CleanUpCollaborationArtifactsModule(),
      ];

  @override
  void binds(i) {
    i.add<SessionPaywallCoordinator>(
      () => SessionPaywallCoordinator(
        cleanUpCollaborationArtifacts:
            Modular.get<CleanUpCollaborationArtifactsCoordinator>(),
        activeMonetizationSession:
            Modular.get<ActiveMonetizationSessionCoordinator>(),
        iap: Modular.get<InAppPurchaseCoordinator>(),
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
      SessionConstants.relativePaywall,
      transition: TransitionType.noTransition,
      child: (context) => SessionPaywallScreen(
        coordinator: Modular.get<SessionPaywallCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeWaitingPatron,
      transition: TransitionType.noTransition,
      child: (context) => WaitingPatronScreen(
        coordinator: Modular.get<WaitingPatronCoordinator>(),
      ),
    );
  }
}
