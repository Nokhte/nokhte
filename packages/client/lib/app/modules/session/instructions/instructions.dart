import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:nokhte/app/modules/session/session_widgets_module.dart';
export 'collaboration_instructions/collaboration_instructions.dart';
export 'consultation_instructions/consultation_instructions.dart';
export './socratic_instructions/socratic_instructions.dart';
export 'shared/shared.dart';

class SessionInstructionsModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SessionWidgetsModule(),
        SessionPresenceModule(),
      ];
  @override
  binds(i) {
    i.add<ShowGroupGeometryCoordinator>(
      () => ShowGroupGeometryCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<ShowGroupGeometryWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
      ),
    );
    i.add<CollaborationFullInstructionsCoordinator>(
      () => CollaborationFullInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<CollaborationFullInstructionsWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
      ),
    );

    i.add<SoloHybridInstructionsCoordinator>(
      () => SoloHybridInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<SoloHybridInstructionsWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
      ),
    );

    i.add<ConsultationNotesSymbolsCoordinator>(
      () => ConsultationNotesSymbolsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<ConsultationNotesSymbolsWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
      ),
    );

    i.add<ConsultationJustSymbolsCoordinator>(
      () => ConsultationJustSymbolsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<ConsultationJustSymbolsWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
      ),
    );

    i.add<ConsultationSpeakingSymbolsCoordinator>(
      () => ConsultationSpeakingSymbolsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<ConsultationSpeakingSymbolsWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
      ),
    );

    i.add<SessionNotesInstructionsCoordinator>(
      () => SessionNotesInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<SessionNotesInstructionsWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
      ),
    );

    i.add<SessionSpeakingInstructionsCoordinator>(
      () => SessionSpeakingInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        widgets: Modular.get<SessionSpeakingInstructionsWidgetsCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
        hold: HoldDetector(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      SessionConstants.relativeSoloHybridInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SoloHybridInstructionsScreen(
        coordinator: Modular.get<SoloHybridInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeCollaborationFullInstructions,
      transition: TransitionType.noTransition,
      child: (context) => CollaborationFullInstructionsScreen(
        coordinator: Modular.get<CollaborationFullInstructionsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeConsultationJustSymbols,
      transition: TransitionType.noTransition,
      child: (context) => ConsultationJustSymbolsScreen(
        coordinator: Modular.get<ConsultationJustSymbolsCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeShowGroupGeometry,
      transition: TransitionType.noTransition,
      child: (context) => ShowGroupGeometryScreen(
        coordinator: Modular.get<ShowGroupGeometryCoordinator>(),
      ),
    );

    r.child(
      SessionConstants.relativeConsultationNotesSymbols,
      transition: TransitionType.noTransition,
      child: (context) => ConsultationNotesSymbolsScreen(
        coordinator: Modular.get<ConsultationNotesSymbolsCoordinator>(),
      ),
    );

    r.child(
      SessionConstants.relativeNotesInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionNotesInstructionsScreen(
        coordinator: Modular.get<SessionNotesInstructionsCoordinator>(),
      ),
    );

    r.child(
      SessionConstants.relativeConsultationSpeakingSymbols,
      transition: TransitionType.noTransition,
      child: (context) => ConsultationSpeakingSymbolsScreen(
        coordinator: Modular.get<ConsultationSpeakingSymbolsCoordinator>(),
      ),
    );

    r.child(
      SessionConstants.relativeSpeakingInstructions,
      transition: TransitionType.noTransition,
      child: (context) => SessionSpeakingInstructionsScreen(
        coordinator: Modular.get<SessionSpeakingInstructionsCoordinator>(),
      ),
    );
  }
}
