import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widget_modules/widget_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/presentation.dart';

class LegacyVirtualNokhteSessionWidgetsModule extends Module {
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
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<WaitingTextStore>(
      () => WaitingTextStore(),
    );
    i.add<LegacyVirtualNokhteSessionPhase0WidgetsCoordinator>(
      () => LegacyVirtualNokhteSessionPhase0WidgetsCoordinator(
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
      ),
    );
    i.add<LegacyVirtualNokhteSessionPhase1WidgetsCoordinator>(
      () => LegacyVirtualNokhteSessionPhase1WidgetsCoordinator(
        gestureCross: i<GestureCrossStore>(),
        waitingText: i<WaitingTextStore>(),
        blur: i<NokhteBlurStore>(),
        borderGlow: i<BorderGlowStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        secondarySmartText: Modular.get<SmartTextStore>(),
        textEditor: Modular.get<TextEditorStore>(),
      ),
    );
    i.add<LegacyVirtualNokhteSessionPhase2WidgetsCoordinator>(
      () => LegacyVirtualNokhteSessionPhase2WidgetsCoordinator(
        gestureCross: i<GestureCrossStore>(),
        waitingText: i<WaitingTextStore>(),
        blur: i<NokhteBlurStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }
}
