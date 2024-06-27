import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export 'speaking/speaking.dart';

class SessionSpeakingModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionPresenceModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SessionSpeakingCoordinator>(
      () => SessionSpeakingCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionSpeakingWidgetsCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        hold: HoldDetector(),
        swipe: SwipeDetector(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      SessionConstants.relativeSpeaking,
      transition: TransitionType.noTransition,
      child: (context) => SessionSpeakingScreen(
        coordinator: Modular.get<SessionSpeakingCoordinator>(),
      ),
    );
  }
}
