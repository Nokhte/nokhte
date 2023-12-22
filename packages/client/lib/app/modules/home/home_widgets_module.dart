import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/mobx/mobx.dart';

class HomeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        ClockModelModule(),
      ];

  @override
  exportedBinds(i) {
    i.addSingleton<SmartTextStore>(
      () => SmartTextStore(),
    );
    i.addSingleton<GestureCrossStore>(
      () => GestureCrossStore(),
    );
    i.addSingleton<SpotlightHaloStore>(
      () => SpotlightHaloStore(),
    );
    i.addSingleton<GradientCircleStore>(
      () => GradientCircleStore(),
    );
    i.addSingleton<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.addSingleton<ClockFaceStore>(
      () => ClockFaceStore(),
    );
    i.addSingleton<HomeScreenWidgetsCoordinator>(
      () => HomeScreenWidgetsCoordinator(
        clockModelCoordinator: Modular.get<ClockModelCoordinator>(),
        nokhteBlur: i<NokhteBlurStore>(),
        smartText: i<SmartTextStore>(),
        wifiDisconnectOverlay: i<WifiDisconnectOverlayStore>(),
        gestureCross: i<GestureCrossStore>(),
        beachWaves: i<BeachWavesStore>(),
      ),
    );
  }
}
