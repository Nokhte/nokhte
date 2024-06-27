import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

export 'group_hybrid/group_hybrid.dart';
export 'hybrid_notes/hybrid_notes.dart';

class SessionHybridModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionPresenceModule(),
      ];
  @override
  void exportedBinds(i) {
    i.add<SessionGroupHybridCoordinator>(
      () => SessionGroupHybridCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionGroupHybridWidgetsCoordinator>(),
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
      SessionConstants.groupHybrid,
      transition: TransitionType.noTransition,
      child: (context) => SessionGroupHybridScreen(
        coordinator: Modular.get<SessionGroupHybridCoordinator>(),
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
