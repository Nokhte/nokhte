import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/login/login.dart';

class LoginWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        ConnectivityModule(),
        GestureCrossModule(),
      ];

  @override
  exportedBinds(i) {
    i.addSingleton<LoginScreenWidgetsCoordinator>(
      () => LoginScreenWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        smartTextStore: SmartTextStore(),
        layer1BeachWaves: BeachWavesStore(),
        layer2BeachWaves: BeachWavesStore(),
      ),
    );
  }
}
