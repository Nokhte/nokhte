import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/widget_modules/widget_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/presentation.dart';

class NokhteSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        SmartTextModule(),
      ];

  @override
  void exportedBinds(Injector i) {
    i.add<NokhteSessionPhase0WidgetsCoordinator>(
      () => NokhteSessionPhase0WidgetsCoordinator(
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        primarySmartText: Modular.get<SmartTextStore>(),
      ),
    );
  }
}
