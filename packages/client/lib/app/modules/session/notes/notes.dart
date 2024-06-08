import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export 'notes/notes.dart';
export 'half_notes_instructions/half_notes_instructions.dart';
export 'full_notes_instructions/full_notes_instructions.dart';
export 'notes_waiting/notes_waiting.dart';

class SessionNotesModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionPresenceModule(),
        GyroscopicModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<SessionFullNotesInstructionsCoordinator>(
      () => SessionFullNotesInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionFullNotesInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<HalfSessionNotesInstructionsCoordinator>(
      () => HalfSessionNotesInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<HalfSessionNotesInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<SessionNotesCoordinator>(
      () => SessionNotesCoordinator(
          tap: TapDetector(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<SessionNotesWidgetsCoordinator>(),
          presence: Modular.get<SessionPresenceCoordinator>(),
          swipe: SwipeDetector()),
    );
    i.add<SessionNotesWaitingCoordinator>(
      () => SessionNotesWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionNotesWaitingWidgetsCoordinator>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      SessionConstants.relativeRoot,
      transition: TransitionType.noTransition,
      child: (context) => SessionNotesScreen(
        coordinator: Modular.get<SessionNotesCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeWaiting,
      transition: TransitionType.noTransition,
      child: (context) => SessionNotesWaitingScreen(
        coordinator: Modular.get<SessionNotesWaitingCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeFullInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionFullNotesInstructionsScreen(
        coordinator: Modular.get<SessionFullNotesInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeHalfInstructions,
      transition: TransitionType.noTransition,
      child: (context) => HalfSessionNotesInstructionsScreen(
        coordinator: Modular.get<HalfSessionNotesInstructionsCoordinator>(),
      ),
    );
  }
}
