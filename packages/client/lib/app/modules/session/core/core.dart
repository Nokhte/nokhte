import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/modules/user_metadata/user_metadata.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'core.dart';
export 'duo_greeter/duo_greeter.dart';
export 'exit/exit.dart';
export 'group_greeter/group_greeter.dart';
export 'lobby/lobby.dart';
export 'trial_greeter/trial_greeter.dart';

class SessionCoreModule extends Module {
  @override
  List<Module> get imports => [
        CleanUpCollaborationArtifactsModule(),
        PosthogModule(),
        SessionPresenceModule(),
        UserMetadataModule(),
        GyroscopicModule(),
        UserInformationModule(),
        DeepLinksModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<SessionLobbyCoordinator>(
      () => SessionLobbyCoordinator(
        userMetadata: Modular.get<UserMetadataCoordinator>(),
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
    i.add<SessionTrialGreeterCoordinator>(
      () => SessionTrialGreeterCoordinator(
        presence: Modular.get<SessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<SessionTrialGreeterWidgetsCoordinator>(),
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
  routes(r) {
    r.child(
      SessionConstants.relativeLobby,
      transition: TransitionType.noTransition,
      child: (context) => SessionLobbyScreen(
        coordinator: Modular.get<SessionLobbyCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeGroupGreeter,
      transition: TransitionType.noTransition,
      child: (context) => SessionGroupGreeterScreen(
        coordinator: Modular.get<SessionGroupGreeterCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeTrialGreeter,
      transition: TransitionType.noTransition,
      child: (context) => SessionTrialGreeterScreen(
        coordinator: Modular.get<SessionTrialGreeterCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeDuoGreeter,
      transition: TransitionType.noTransition,
      child: (context) => SessionDuoGreeterScreen(
        coordinator: Modular.get<SessionDuoGreeterCoordinator>(),
      ),
    );
    r.child(
      SessionConstants.relativeExit,
      transition: TransitionType.noTransition,
      child: (context) => SessionExitScreen(
        coordinator: Modular.get<SessionExitCoordinator>(),
      ),
    );
  }
}
