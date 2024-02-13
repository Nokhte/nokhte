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
    i.add<Phase0HomeScreenWidgetsCoordinator>(
      () => Phase0HomeScreenWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
    i.add<Phase1HomeScreenWidgetsCoordinator>(
      () => Phase1HomeScreenWidgetsCoordinator(
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
    i.add<Phase2HomeScreenWidgetsCoordinator>(
      () => Phase2HomeScreenWidgetsCoordinator(
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
    i.add<Phase3HomeScreenWidgetsCoordinator>(
      () => Phase3HomeScreenWidgetsCoordinator(
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
  }
}
