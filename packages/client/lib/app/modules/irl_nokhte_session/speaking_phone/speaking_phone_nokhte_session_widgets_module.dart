import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widget_modules/mirrored_text_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'presentation/presentation.dart';

class SpeakingPhoneNokhteSessionWidgetsModule extends Module {
  @override
  @override
  List<Module> get imports => [
        MirroredTextModule(),
        WifiDisconnectOverlayModule(),
        BeachWavesModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<BorderGlowStore>(
      () => BorderGlowStore(),
    );
    i.add<IrlNokhteSessionSpeakingScreenWidgetsCoordinator>(
      () => IrlNokhteSessionSpeakingScreenWidgetsCoordinator(
          mirroredText: Modular.get<MirroredTextStore>(),
          borderGlow: Modular.get<BorderGlowStore>(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: Modular.get<BeachWavesStore>()),
    );
  }
}
