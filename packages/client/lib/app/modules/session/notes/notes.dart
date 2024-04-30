import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'notes.dart';
export 'notes/notes.dart';
export 'notes_inactivity/notes_inactivity.dart';
export 'notes_instructions/notes_instructions.dart';
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
    i.add<SessionNotesInstructionsCoordinator>(
      () => SessionNotesInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionNotesInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<SessionNotesCoordinator>(
      () => SessionNotesCoordinator(
          tap: TapDetector(),
          gyroscopic: Modular.get<GyroscopicCoordinator>(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<SessionNotesWidgetsCoordinator>(),
          presence: Modular.get<SessionPresenceCoordinator>(),
          swipe: SwipeDetector()),
    );
    i.add<SessionNotesInactivityCoordinator>(
      () => SessionNotesInactivityCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionNotesInactivityWidgetsCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
      ),
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
      transition: TransitionType.noTransition,
      '/waiting',
      child: (context) => SessionNotesWaitingScreen(
        coordinator: Modular.get<SessionNotesWaitingCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/instructions',
      child: (context) => SessionNotesInstructionsScreen(
        coordinator: Modular.get<SessionNotesInstructionsCoordinator>(),
      ),
    );
    r.child(
      '/inactivity',
      child: (context) => SessionNotesInactivityScreen(
        coordinator: Modular.get<SessionNotesInactivityCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/',
      child: (context) => SessionNotesScreen(
        coordinator: Modular.get<SessionNotesCoordinator>(),
      ),
    );
  }
}
