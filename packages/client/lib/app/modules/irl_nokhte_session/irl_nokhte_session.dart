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
import 'irl_nokhte_session.dart';
export 'shared/shared.dart';
export 'speaking_phone/speaking_phone.dart';
export 'notes_phone/notes_phone.dart';

class IrlNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        SharedIrlNokhteSessionModule(),
        SharedIrlNokhteSessionWidgetsModule(),
        NotesPhoneNokhteSessionWidgetsModule(),
        SpeakingPhoneNokhteSessionWidgetsModule(),
        CleanUpCollaborationArtifactsModule(),
        PosthogModule(),
        SessionPresenceModule(),
        GyroscopicModule(),
        UserInformationModule(),
        DeepLinksModule(),
      ];

  @override
  void binds(i) {
    i.add<IrlNokhteSessionLobbyCoordinator>(
      () => IrlNokhteSessionLobbyCoordinator(
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        tap: TapDetector(),
        widgets: Modular.get<IrlNokhteSessionLobbyWidgetsCoordinator>(),
      ),
    );
    i.add<IrlNokhteSessionGreeterCoordinator>(
      () => IrlNokhteSessionGreeterCoordinator(
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<IrlNokhteSessionGreeterWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<IrlNokhteSessionSpeakingInstructionsCoordinator>(
      () => IrlNokhteSessionSpeakingInstructionsCoordinator(
        hold: HoldDetector(),
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<
            IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<IrlNokhteSessionSpeakingCoordinator>(
      () => IrlNokhteSessionSpeakingCoordinator(
        gyroscopic: Modular.get<GyroscopicCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<IrlNokhteSessionSpeakingWidgetsCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
        hold: HoldDetector(),
        swipe: SwipeDetector(),
      ),
    );
    i.add<IrlNokhteSessionSpeakingWaitingCoordinator>(
      () => IrlNokhteSessionSpeakingWaitingCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<IrlNokhteSessionSpeakingWaitingWidgetsCoordinator>(),
      ),
    );
    i.add<IrlNokhteSessionNotesInstructionsCoordinator>(
      () => IrlNokhteSessionNotesInstructionsCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<IrlNokhteSessionNotesInstructionsWidgetsCoordinator>(),
        tap: TapDetector(),
      ),
    );
    i.add<IrlNokhteSessionNotesCoordinator>(
      () => IrlNokhteSessionNotesCoordinator(
          tap: TapDetector(),
          gyroscopic: Modular.get<GyroscopicCoordinator>(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<IrlNokhteSessionNotesWidgetsCoordinator>(),
          presence: Modular.get<SessionPresenceCoordinator>(),
          swipe: SwipeDetector()),
    );
    i.add<IrlNokhteSessionNotesInactivityCoordinator>(
      () => IrlNokhteSessionNotesInactivityCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<IrlNokhteSessionNotesInactivityWidgetsCoordinator>(),
        presence: Modular.get<SessionPresenceCoordinator>(),
      ),
    );
    i.add<IrlNokhteSessionExitCoordinator>(
      () => IrlNokhteSessionExitCoordinator(
        cleanUpCollaborationArtifacts:
            Modular.get<CleanUpCollaborationArtifactsCoordinator>(),
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        swipe: SwipeDetector(),
        widgets: Modular.get<IrlNokhteSessionExitWidgetsCoordinator>(),
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
      child: (context) => IrlNokhteSessionLobbyScreen(
        coordinator: Modular.get<IrlNokhteSessionLobbyCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/greeter',
      child: (context) => IrlNokhteSessionGreeterScreen(
        coordinator: Modular.get<IrlNokhteSessionGreeterCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/speaking_instructions',
      child: (context) => IrlNokhteSessionSpeakingInstructionsScreen(
        coordinator:
            Modular.get<IrlNokhteSessionSpeakingInstructionsCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/speaking_waiting',
      child: (context) => IrlNokhteSessionSpeakingWaitingScreen(
        coordinator: Modular.get<IrlNokhteSessionSpeakingWaitingCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/speaking',
      child: (context) => IrlNokhteSessionSpeakingScreen(
        coordinator: Modular.get<IrlNokhteSessionSpeakingCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/notes_instructions',
      child: (context) => IrlNokhteSessionNotesInstructionsScreen(
        coordinator:
            Modular.get<IrlNokhteSessionNotesInstructionsCoordinator>(),
      ),
    );
    r.child(
      '/notes_inactivity',
      child: (context) => IrlNokhteSessionNotesInactivityScreen(
        coordinator: Modular.get<IrlNokhteSessionNotesInactivityCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/notes',
      child: (context) => IrlNokhteSessionNotesScreen(
        coordinator: Modular.get<IrlNokhteSessionNotesCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/exit',
      child: (context) => IrlNokhteSessionExitScreen(
        coordinator: Modular.get<IrlNokhteSessionExitCoordinator>(),
      ),
    );
  }
}
