import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session_widgets_module.dart';
import 'session.dart';
export 'shared/shared.dart';
export 'constants/constants.dart';
export 'types/types.dart';
export 'speaking/speaking.dart';
export 'notes/notes.dart';
export 'hybrid/hybrid.dart';

class SessionModule extends Module {
  @override
  List<Module> get imports => [
        SessionWidgetsModule(),
        CleanUpCollaborationArtifactsModule(),
        PosthogModule(),
        SessionPresenceModule(),
        GyroscopicModule(),
        UserInformationModule(),
        DeepLinksModule(),
      ];

  @override
  void binds(i) {
    i.add<SessionLobbyCoordinator>(
      () => SessionLobbyCoordinator(
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
        widgets: Modular.get<SessionLobbyWidgetsCoordinator>(),
      ),
    );
    i.add<SessionDuoGreeterCoordinator>(
      () => SessionDuoGreeterCoordinator(
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionDuoGreeterWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<SessionGroupGreeterCoordinator>(
      () => SessionGroupGreeterCoordinator(
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionGroupGreeterWidgetsCoordinator>(),
        tap: TapDetector(),
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
    i.add<SessionNotesWaitingCoordinator>(
      () => SessionNotesWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionNotesWaitingWidgetsCoordinator>(),
      ),
    );
    i.add<SessionHybridWaitingCoordinator>(
      () => SessionHybridWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionHybridWaitingWidgetsCoordinator>(),
      ),
    );
    i.add<SessionSpeakingWaitingCoordinator>(
      () => SessionSpeakingWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionSpeakingWaitingWidgetsCoordinator>(),
      ),
    );
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
    i.add<SessionExitCoordinator>(
      () => SessionExitCoordinator(
        cleanUpCollaborationArtifacts:
            Modular.get<CleanUpCollaborationArtifactsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<SessionExitWidgetsCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      transition: TransitionType.noTransition,
      '/',
      child: (context) => SessionLobbyScreen(
        coordinator: Modular.get<SessionLobbyCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/group_greeter',
      child: (context) => SessionGroupGreeterScreen(
        coordinator: Modular.get<SessionGroupGreeterCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/duo_greeter',
      child: (context) => SessionDuoGreeterScreen(
        coordinator: Modular.get<SessionDuoGreeterCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/speaking_instructions',
      child: (context) => SessionSpeakingInstructionsScreen(
        coordinator: Modular.get<SessionSpeakingInstructionsCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/speaking_waiting',
      child: (context) => SessionSpeakingWaitingScreen(
        coordinator: Modular.get<SessionSpeakingWaitingCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/hybrid_speaking_instructions',
      child: (context) => SessionHybridSpeakingInstructionsScreen(
        coordinator:
            Modular.get<SessionHybridSpeakingInstructionsCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/hybrid_waiting',
      child: (context) => SessionHybridWaitingScreen(
        coordinator: Modular.get<SessionHybridWaitingCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/hybrid_notes_instructions',
      child: (context) => SessionHybridNotesInstructionsScreen(
        coordinator: Modular.get<SessionHybridNotesInstructionsCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/notes_waiting',
      child: (context) => SessionNotesWaitingScreen(
        coordinator: Modular.get<SessionNotesWaitingCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/hybrid',
      child: (context) => const Scaffold(
          body: Center(
        child: Text("HYBRID!!!"),
      )),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/speaking',
      child: (context) => SessionSpeakingScreen(
        coordinator: Modular.get<SessionSpeakingCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/notes_instructions',
      child: (context) => SessionNotesInstructionsScreen(
        coordinator: Modular.get<SessionNotesInstructionsCoordinator>(),
      ),
    );
    r.child(
      '/notes_inactivity',
      child: (context) => SessionNotesInactivityScreen(
        coordinator: Modular.get<SessionNotesInactivityCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/notes',
      child: (context) => SessionNotesScreen(
        coordinator: Modular.get<SessionNotesCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/exit',
      child: (context) => SessionExitScreen(
        coordinator: Modular.get<SessionExitCoordinator>(),
      ),
    );
  }
}
