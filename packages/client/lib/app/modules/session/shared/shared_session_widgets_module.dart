import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/shared/shared.dart';

class SharedSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SessionLobbyWidgetsCoordinator>(
      () => SessionLobbyWidgetsCoordinator(
          touchRipple: TouchRippleStore(),
          primarySmartText: SmartTextStore(),
          qrCode: NokhteQrCodeStore(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: BeachWavesStore()),
    );
    i.add<SessionDuoGreeterWidgetsCoordinator>(
      () => SessionDuoGreeterWidgetsCoordinator(
          touchRipple: TouchRippleStore(),
          primarySmartText: SmartTextStore(),
          secondarySmartText: SmartTextStore(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: BeachWavesStore()),
    );
    i.add<SessionGroupGreeterWidgetsCoordinator>(
      () => SessionGroupGreeterWidgetsCoordinator(
          tint: TintStore(),
          sessionSeatingGuide: SessionSeatingGuideStore(),
          touchRipple: TouchRippleStore(),
          primarySmartText: SmartTextStore(),
          secondarySmartText: SmartTextStore(),
          wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
          beachWaves: BeachWavesStore()),
    );
    i.add<SessionExitWidgetsCoordinator>(
      () => SessionExitWidgetsCoordinator(
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
