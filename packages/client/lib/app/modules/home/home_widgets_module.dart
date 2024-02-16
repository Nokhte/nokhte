import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/mobx/mobx.dart';

class HomeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        CircleExplanationModule(),
        SmartTextModule(),
        GestureCrossModule(),
      ];

  @override
  exportedBinds(i) {
    i.add<CrossStore>(
      () => CrossStore(),
    );
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<HomeScreenPhase0WidgetsCoordinator>(
      () => HomeScreenPhase0WidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
    i.add<HomeScreenPhase1WidgetsCoordinator>(
      () => HomeScreenPhase1WidgetsCoordinator(
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
    i.add<HomeScreenPhase2WidgetsCoordinator>(
      () => HomeScreenPhase2WidgetsCoordinator(
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
    i.add<HomeScreenPhase3WidgetsCoordinator>(
      () => HomeScreenPhase3WidgetsCoordinator(
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
  }
}
