import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'presets.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';

class PresetsWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<PresetsWidgetsCoordinator>(
      () => PresetsWidgetsCoordinator(
        headerText: SmartTextStore(),
        presetCards: PresetCardsStore(
          condensed: CondensedPresetCardsStore(),
          expanded: ExpandedPresetCardsStore(),
        ),
        nokhteBlur: NokhteBlurStore(),
        touchRipple: TouchRippleStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<PresetsInstructionsWidgetsCoordinator>(
      () => PresetsInstructionsWidgetsCoordinator(
        blur: NokhteBlurStore(),
        presetCards: PresetCardsStore(
          condensed: CondensedPresetCardsStore(),
          expanded: ExpandedPresetCardsStore(),
        ),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        headerText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }
}
