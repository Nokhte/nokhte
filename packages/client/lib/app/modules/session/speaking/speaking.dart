import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export 'speaking/speaking.dart';
export 'speaking_instructions/speaking_instructions.dart';
export 'speaking_waiting/speaking_waiting.dart';

class SessionSpeakingModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionPresenceModule(),
        GyroscopicModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SessionSpeakingWaitingCoordinator>(
      () => SessionSpeakingWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionSpeakingWaitingWidgetsCoordinator>(),
      ),
    );

    i.add<SessionSpeakingInstructionsCoordinator>(
      () => SessionSpeakingInstructionsCoordinator(
        hold: HoldDetector(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionSpeakingInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<SessionSpeakingCoordinator>(
      () => SessionSpeakingCoordinator(
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
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
      SessionConstants.relativeRoot,
      transition: TransitionType.noTransition,
      child: (context) => SessionSpeakingScreen(
        coordinator: Modular.get<SessionSpeakingCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionSpeakingInstructionsScreen(
        coordinator: Modular.get<SessionSpeakingInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeWaiting,
      transition: TransitionType.noTransition,
      child: (context) => SessionSpeakingWaitingScreen(
        coordinator: Modular.get<SessionSpeakingWaitingCoordinator>(),
      ),
    );
    //
  }
}
