import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts_module.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session.dart';
export 'shared/shared.dart';
export 'speaking/speaking.dart';
export 'notes/notes.dart';

class SessionModule extends Module {
  @override
  List<Module> get imports => [
        SharedSessionModule(),
        SharedSessionWidgetsModule(),
        NotesSessionWidgetsModule(),
        SpeakingSessionWidgetsModule(),
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
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionDuoGreeterWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<SessionGroupGreeterCoordinator>(
      () => SessionGroupGreeterCoordinator(
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionGroupGreeterWidgetsCoordinator>(),
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
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
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
