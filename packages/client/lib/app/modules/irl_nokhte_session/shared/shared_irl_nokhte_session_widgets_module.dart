import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/presentation/mobx/coordinators/phase0/irl_nokhte_session_phase0_widgets_coordinator.dart';

class SharedIrlNokhteSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        SmartTextModule(),
        WifiDisconnectOverlayModule(),
        BeachWavesModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<TouchRippleStore>(() => TouchRippleStore());
    i.add<IrlNokhteSessionPhase0WidgetsCoordinator>(
      () => IrlNokhteSessionPhase0WidgetsCoordinator(
          touchRipple: Modular.get<TouchRippleStore>(),
          primarySmartText: Modular.get<SmartTextStore>(),
          secondarySmartText: Modular.get<SmartTextStore>(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: Modular.get<BeachWavesStore>()),
    );
  }
}
