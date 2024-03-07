import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'speaking_phone.dart';

class SpeakingPhoneNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SpeakingPhoneNokhteSessionWidgetsModule(),
        IrlNokhteSessionPresenceModule(),
        GesturesModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<IrlNokhteSessionSpeakingInstructionsScreenCoordinator>(
      () => IrlNokhteSessionSpeakingInstructionsScreenCoordinator(
        presence: Modular.get<IrlNokhteSessionPresenceCoordinator>(),
        captureScreen: Modular.get<CaptureScreen>(),
        widgets: Modular.get<
            IrlNokhteSessionSpeakingInstructionsScreenWidgetsCoordinator>(),
        tap: Modular.get<TapDetector>(),
      ),
    );
  }
}
