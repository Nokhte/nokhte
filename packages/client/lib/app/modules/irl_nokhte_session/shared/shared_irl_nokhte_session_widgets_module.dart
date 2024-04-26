import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/shared.dart';

class SharedIrlNokhteSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<IrlNokhteSessionLobbyWidgetsCoordinator>(
      () => IrlNokhteSessionLobbyWidgetsCoordinator(
          touchRipple: TouchRippleStore(),
          primarySmartText: SmartTextStore(),
          qrCode: NokhteQrCodeStore(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: BeachWavesStore()),
    );
    i.add<IrlNokhteSessionDuoGreeterWidgetsCoordinator>(
      () => IrlNokhteSessionDuoGreeterWidgetsCoordinator(
          touchRipple: TouchRippleStore(),
          primarySmartText: SmartTextStore(),
          secondarySmartText: SmartTextStore(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: BeachWavesStore()),
    );
    i.add<IrlNokhteSessionGroupGreeterWidgetsCoordinator>(
      () => IrlNokhteSessionGroupGreeterWidgetsCoordinator(
          touchRipple: TouchRippleStore(),
          primarySmartText: SmartTextStore(),
          secondarySmartText: SmartTextStore(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: BeachWavesStore()),
    );
    i.add<IrlNokhteSessionExitWidgetsCoordinator>(
      () => IrlNokhteSessionExitWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        tertiarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }
}
