import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/shared.dart';

class SharedIrlNokhteSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<IrlNokhteSessionPhase0WidgetsCoordinator>(
      () => IrlNokhteSessionPhase0WidgetsCoordinator(
          touchRipple: TouchRippleStore(),
          primarySmartText: SmartTextStore(),
          secondarySmartText: SmartTextStore(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: BeachWavesStore()),
    );
    i.add<IrlNokhteSessionPhase3WidgetsCoordinator>(
      () => IrlNokhteSessionPhase3WidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }
}
