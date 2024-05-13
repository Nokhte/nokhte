import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

export 'hybrid/hybrid.dart';
export 'hybrid_notes/hybrid_notes.dart';
export 'hybrid_speaking_instructions/hybrid_speaking_instructions.dart';
export 'hybrid_waiting/hybrid_waiting.dart';
export 'hybrid_notes_instructions/hybrid_notes_instructions.dart';

class SessionHybridModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionPresenceModule(),
        GyroscopicModule(),
      ];
  @override
  void exportedBinds(i) {
    i.add<SessionHybridCoordinator>(
      () => SessionHybridCoordinator(
        tap: TapDetector(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionHybridWidgetsCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        hold: HoldDetector(),
        swipe: SwipeDetector(),
      ),
    );
    i.add<SessionHybridWaitingCoordinator>(
      () => SessionHybridWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionHybridWaitingWidgetsCoordinator>(),
      ),
    );
    i.add<SessionHybridSpeakingInstructionsCoordinator>(
      () => SessionHybridSpeakingInstructionsCoordinator(
        hold: HoldDetector(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<SessionHybridSpeakingInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<SessionHybridNotesInstructionsCoordinator>(
      () => SessionHybridNotesInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<SessionHybridNotesInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<SessionHybridNotesCoordinator>(
      () => SessionHybridNotesCoordinator(
          tap: TapDetector(),
          gyroscopic: Modular.get<GyroscopicCoordinator>(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<SessionHybridNotesWidgetsCoordinator>(),
          presence: Modular.get<SessionPresenceCoordinator>(),
          swipe: SwipeDetector()),
    );
  }

  @override
  routes(r) {
    r.child(
      SessionConstants.root,
      transition: TransitionType.noTransition,
      child: (context) => SessionHybridScreen(
        coordinator: Modular.get<SessionHybridCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeSpeakingInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionHybridSpeakingInstructionsScreen(
        coordinator:
            Modular.get<SessionHybridSpeakingInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeWaiting,
      transition: TransitionType.noTransition,
      child: (context) => SessionHybridWaitingScreen(
        coordinator: Modular.get<SessionHybridWaitingCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeNotesInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionHybridNotesInstructionsScreen(
        coordinator: Modular.get<SessionHybridNotesInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeNotes,
      transition: TransitionType.noTransition,
      child: (context) => SessionHybridNotesScreen(
        coordinator: Modular.get<SessionHybridNotesCoordinator>(),
      ),
    );
    //
  }
}
