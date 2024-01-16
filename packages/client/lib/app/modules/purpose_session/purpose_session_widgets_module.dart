import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widget_modules/widget_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/coordinators/phase_one/phase_one.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/coordinators/phase_zero/purpose_session_phase_zero_widgets_coordinator.dart';

class PurposeSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        SmartTextModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<BorderGlowStore>(
      () => BorderGlowStore(),
    );
    i.add<PurposeSessionPhaseZeroWidgetsCoordinator>(
      () => PurposeSessionPhaseZeroWidgetsCoordinator(
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
      ),
    );
    i.add<PurposeSessionPhaseOneWidgetsCoordinator>(
      () => PurposeSessionPhaseOneWidgetsCoordinator(
          borderGlow: i<BorderGlowStore>(),
          beachWaves: Modular.get<BeachWavesStore>(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          primarySmartText: Modular.get<SmartTextStore>(),
          errorText: Modular.get<SmartTextStore>(),
          secondarySmartText: Modular.get<SmartTextStore>(),
          nokhteBlur: Modular.get<NokhteBlurStore>()),
    );
  }
}
