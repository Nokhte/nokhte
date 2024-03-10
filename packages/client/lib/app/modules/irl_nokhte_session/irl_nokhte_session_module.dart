import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
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
          captureScreen: Modular.get<CaptureScreen>(),
          widgets: Modular.get<IrlNokhteSessionNotesWidgetsCoordinator>(),
          presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
          swipe: Modular.get<SwipeDetector>()),
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
  }
}
