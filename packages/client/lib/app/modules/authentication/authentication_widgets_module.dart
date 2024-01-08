import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';

class AuthenticationWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        SmartTextModule(),
        GestureCrossModule(),
      ];

  @override
  exportedBinds(i) {
    i.addSingleton<NokhteStore>(
      () => NokhteStore(),
    );
    i.add<TrailingTextStore>(
      () => TrailingTextStore(),
    );
    i.addSingleton<LoginScreenWidgetsCoordinator>(
      () => LoginScreenWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        nokhte: i<NokhteStore>(),
        smartTextStore: Modular.get<SmartTextStore>(),
        layer1BeachWaves: Modular.get<BeachWavesStore>(),
        layer2BeachWaves: Modular.get<BeachWavesStore>(),
        bottomTrailingText: i<TrailingTextStore>(),
        topTrailingText: i<TrailingTextStore>(),
      ),
    );
  }
}
