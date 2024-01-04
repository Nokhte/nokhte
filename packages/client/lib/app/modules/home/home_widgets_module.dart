import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/mobx/mobx.dart';

class HomeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        TimeAlignmentModelModule(),
        CircleExplanationModule(),
        SmartTextModule(),
        GestureCrossModule(),
      ];

  @override
  exportedBinds(i) {
    i.add<CrossStore>(
      () => CrossStore(),
    );
    i.addSingleton<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.addSingleton<HomeScreenWidgetsCoordinator>(
      () => HomeScreenWidgetsCoordinator(
        timeModel: Modular.get<TimeAlignmentModelCoordinator>(),
        nokhteBlur: i<NokhteBlurStore>(),
        primarySmartText: i<SmartTextStore>(),
        secondarySmartText: i<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
      ),
    );
  }
}
