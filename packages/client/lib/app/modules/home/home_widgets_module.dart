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
        CircleExplanationModule(),
      ];

  @override
  exportedBinds(i) {
    i.add<SmartTextStore>(
      () => SmartTextStore(),
    );
    i.add<GestureCrossStore>(
      () => GestureCrossStore(),
    );
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.addSingleton<HomeScreenWidgetsCoordinator>(
      () => HomeScreenWidgetsCoordinator(
        clockModelCoordinator: Modular.get<ClockModelCoordinator>(),
        nokhteBlur: Modular.get<NokhteBlurStore>(),
        smartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
    i.addSingleton<CircleExplanationWidgetsCoordinator>(
      () => CircleExplanationWidgetsCoordinator(
          nokhteBlur: Modular.get<NokhteBlurStore>(),
          beachWaves: Modular.get<BeachWavesStore>(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          smartText: Modular.get<SmartTextStore>(),
          gestureCross: Modular.get<GestureCrossStore>(),
          circleModel: Modular.get<CircleExplanationModelCoordinator>()),
    );
  }
}
