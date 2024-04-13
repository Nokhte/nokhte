import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';

class AuthenticationWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];

  @override
  exportedBinds(i) {
    i.addSingleton<LoginScreenWidgetsCoordinator>(
      () => LoginScreenWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        nokhte: NokhteStore(),
        smartTextStore: SmartTextStore(),
        layer1BeachWaves: BeachWavesStore(),
        layer2BeachWaves: BeachWavesStore(),
        bottomTrailingText: TrailingTextStore(),
        topTrailingText: TrailingTextStore(),
      ),
    );
  }
}
