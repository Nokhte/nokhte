import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export 'speaking/speaking.dart';
export 'full_speaking_instructions/full_speaking_instructions.dart';
export 'half_speaking_instructions/half_speaking_instructions.dart';
export 'speaking_waiting/speaking_waiting.dart';
export 'speaking_root_router/speaking_root_router.dart';

class SessionSpeakingModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionPresenceModule(),
        GyroscopicModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SessionSpeakingRootRouterCoordinator>(
      () => SessionSpeakingRootRouterCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionSpeakingRootRouterWidgetsCoordinator>(),
      ),
    );
    i.add<SessionSpeakingWaitingCoordinator>(
      () => SessionSpeakingWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionSpeakingWaitingWidgetsCoordinator>(),
      ),
    );

    i.add<HalfSessionSpeakingInstructionsCoordinator>(
      () => HalfSessionSpeakingInstructionsCoordinator(
        hold: HoldDetector(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<HalfSessionSpeakingInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<FullSessionSpeakingInstructionsCoordinator>(
      () => FullSessionSpeakingInstructionsCoordinator(
        hold: HoldDetector(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<FullSessionSpeakingInstructionsWidgetsCoordinator>(),
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
      child: (context) => SessionSpeakingRootRouterScreen(
        coordinator: Modular.get<SessionSpeakingRootRouterCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeSpeaking,
      transition: TransitionType.noTransition,
      child: (context) => SessionSpeakingScreen(
        coordinator: Modular.get<SessionSpeakingCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeHalfInstructions,
      transition: TransitionType.noTransition,
      child: (context) => HalfSessionSpeakingInstructionsScreen(
        coordinator: Modular.get<HalfSessionSpeakingInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeFullInstructions,
      transition: TransitionType.noTransition,
      child: (context) => FullSessionSpeakingInstructionsScreen(
        coordinator: Modular.get<FullSessionSpeakingInstructionsCoordinator>(),
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
