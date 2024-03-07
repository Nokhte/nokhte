import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'speaking_phone.dart';

class SpeakingPhoneNokhteSessionModule extends Module {
  @override
  List<Module> get imports => [
        PosthogModule(),
        SpeakingPhoneNokhteSessionWidgetsModule(),
        GesturesModule(),
      ];

  @override
  void exportedBinds(i) {
    i.add<IrlNokhteSessionSpeakingScreenCoordinator>(
      () => IrlNokhteSessionSpeakingScreenCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        widgets:
            Modular.get<IrlNokhteSessionSpeakingScreenWidgetsCoordinator>(),
        hold: Modular.get<HoldDetector>(),
        swipe: Modular.get<SwipeDetector>(),
      ),
    );
  }
}
