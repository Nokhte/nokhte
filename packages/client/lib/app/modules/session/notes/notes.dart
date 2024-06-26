import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export 'notes/notes.dart';

class SessionNotesModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionPresenceModule(),
        GyroscopicModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<SessionNotesCoordinator>(
      () => SessionNotesCoordinator(
          tap: TapDetector(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<SessionNotesWidgetsCoordinator>(),
          presence: Modular.get<SessionPresenceCoordinator>(),
          swipe: SwipeDetector()),
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
  }
}
