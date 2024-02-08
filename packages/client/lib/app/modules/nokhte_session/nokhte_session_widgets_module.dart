import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widget_modules/widget_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/presentation.dart';

class NokhteSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        SmartTextModule(),
        GestureCrossModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<BorderGlowStore>(
      () => BorderGlowStore(),
    );

    i.add<TextEditorStore>(
      () => TextEditorStore(),
    );
    i.add<NokhteSessionPhase0WidgetsCoordinator>(
      () => NokhteSessionPhase0WidgetsCoordinator(
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
      ),
    );
    i.add<NokhteSessionPhase1WidgetsCoordinator>(
      () => NokhteSessionPhase1WidgetsCoordinator(
        gestureCross: i<GestureCrossStore>(),      
        borderGlow: i<BorderGlowStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        secondarySmartText: Modular.get<SmartTextStore>(),
        textEditor: Modular.get<TextEditorStore>(),
      ),
    );
  }
}
