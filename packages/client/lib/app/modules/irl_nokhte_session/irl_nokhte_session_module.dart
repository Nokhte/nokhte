import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic_module.dart';
import 'package:nokhte/app/core/modules/gyroscopic/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'notes_phone/notes_phone.dart';
import 'speaking_phone/speaking_phone.dart';
import 'shared/shared.dart';

class IrlNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        SharedIrlNokhteSessionModule(),
        SharedIrlNokhteSessionWidgetsModule(),
        NotesPhoneNokhteSessionWidgetsModule(),
        SpeakingPhoneNokhteSessionWidgetsModule(),
        PosthogModule(),
        IrlNokhteSessionPresenceModule(),
        GesturesModule(),
        GyroscopicModule(),
        UserInformationModule(),
      ];

  @override
  void binds(i) {
    i.add<IrlNokhteSessionPhase0Coordinator>(
      () => IrlNokhteSessionPhase0Coordinator(
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
        presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<IrlNokhteSessionPhase0WidgetsCoordinator>(),
        tap: Modular.get<TapDetector>(),
      ),
    );
    i.add<IrlNokhteSessionSpeakingInstructionsCoordinator>(
      () => IrlNokhteSessionSpeakingInstructionsCoordinator(
        presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<
            IrlNokhteSessionSpeakingInstructionsWidgetsCoordinator>(),
        tap: Modular.get<TapDetector>(),
      ),
    );
    i.add<IrlNokhteSessionSpeakingCoordinator>(
      () => IrlNokhteSessionSpeakingCoordinator(
          getTiltStream: Modular.get<GetTiltStreamStore>(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<IrlNokhteSessionSpeakingWidgetsCoordinator>(),
          presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
          hold: Modular.get<HoldDetector>(),
          swipe: Modular.get<SwipeDetector>()),
    );
    i.add<IrlNokhteSessionNotesInstructionsCoordinator>(
      () => IrlNokhteSessionNotesInstructionsCoordinator(
        presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<IrlNokhteSessionNotesInstructionsWidgetsCoordinator>(),
        tap: Modular.get<TapDetector>(),
      ),
    );
    i.add<IrlNokhteSessionNotesCoordinator>(
      () => IrlNokhteSessionNotesCoordinator(
          getTiltStream: Modular.get<GetTiltStreamStore>(),
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<IrlNokhteSessionNotesWidgetsCoordinator>(),
          presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
          swipe: Modular.get<SwipeDetector>()),
    );
    i.add<IrlNokhteSessionPhase3Coordinator>(
      () => IrlNokhteSessionPhase3Coordinator(
        decidePhoneRoleLogic: Modular.get<DecidePhoneRole>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<IrlNokhteSessionPhase3WidgetsCoordinator>(),
        presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      transition: TransitionType.noTransition,
      '/',
      child: (context) => IrlNokhteSessionPhase0Screen(
        coordinator: Modular.get<IrlNokhteSessionPhase0Coordinator>(),
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
      transition: TransitionType.noTransition,
      '/notes',
      child: (context) => IrlNokhteSessionNotesScreen(
        coordinator: Modular.get<IrlNokhteSessionNotesCoordinator>(),
      ),
    );
    r.child(
      transition: TransitionType.noTransition,
      '/exit',
      child: (context) => IrlNokhteSessionPhase3Screen(
        coordinator: Modular.get<IrlNokhteSessionPhase3Coordinator>(),
      ),
    );
  }
}
