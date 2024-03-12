import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widget_modules/mirrored_text_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'presentation/presentation.dart';

class NotesPhoneNokhteSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        MirroredTextModule(),
        WifiDisconnectOverlayModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<IrlNokhteSessionNotesInstructionsWidgetsCoordinator>(
      () => IrlNokhteSessionNotesInstructionsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<IrlNokhteSessionNotesWidgetsCoordinator>(
      () => IrlNokhteSessionNotesWidgetsCoordinator(
        smartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        textEditor: TextEditorStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
  }
}
