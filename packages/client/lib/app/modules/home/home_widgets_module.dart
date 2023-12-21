import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_widgets_coordinator.dart';

class HomeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
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
        clockFace: i<ClockFaceStore>(),
        gradientCircle: i<GradientCircleStore>(),
        nokhteBlur: i<NokhteBlurStore>(),
        spotlightHalo: i<SpotlightHaloStore>(),
        smartText: i<SmartTextStore>(),
        wifiDisconnectOverlay: i<WifiDisconnectOverlayStore>(),
        gestureCross: i<GestureCrossStore>(),
        beachWaves: i<BeachWavesStore>(),
      ),
    );
  }
}
