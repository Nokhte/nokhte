import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widget_modules/widget_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'presentation/presentation.dart';

class PurposeSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        SmartTextModule(),
        GestureCrossModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<BorderGlowStore>(
      () => BorderGlowStore(),
    );
    i.add<TextEditorStore>(
      () => TextEditorStore(),
    );
    i.add<PurposeSessionPhase0WidgetsCoordinator>(
      () => PurposeSessionPhase0WidgetsCoordinator(
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
      ),
    );
    i.add<PurposeSessionPhase1WidgetsCoordinator>(
      () => PurposeSessionPhase1WidgetsCoordinator(
        borderGlow: i<BorderGlowStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        errorText: Modular.get<SmartTextStore>(),
        secondarySmartText: Modular.get<SmartTextStore>(),
        nokhteBlur: Modular.get<NokhteBlurStore>(),
      ),
    );
    i.add<PurposeSessionPhase2WidgetsCoordinator>(
      () => PurposeSessionPhase2WidgetsCoordinator(
        textEditor: Modular.get<TextEditorStore>(),
        errorText: Modular.get<SmartTextStore>(),
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        unsubmittedGestureCross: Modular.get<GestureCrossStore>(),
        submittedGestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
      ),
    );
    i.add<PurposeSessionPhase3WidgetsCoordinator>(
      () => PurposeSessionPhase3WidgetsCoordinator(),
    );
  }
}
