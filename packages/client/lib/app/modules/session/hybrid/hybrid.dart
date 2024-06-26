import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

export 'hybrid/hybrid.dart';
export 'hybrid_notes/hybrid_notes.dart';

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
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionHybridWidgetsCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        hold: HoldDetector(),
        swipe: SwipeDetector(),
      ),
    );
    i.add<SessionHybridNotesCoordinator>(
      () => SessionHybridNotesCoordinator(
          tap: TapDetector(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<SessionHybridNotesWidgetsCoordinator>(),
          presence: Modular.get<SessionPresenceCoordinator>(),
          swipe: SwipeDetector()),
    );
  }

  @override
  routes(r) {
    r.child(
      SessionConstants.hybrid,
      transition: TransitionType.noTransition,
      child: (context) => SessionHybridScreen(
        coordinator: Modular.get<SessionHybridCoordinator>(),
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
