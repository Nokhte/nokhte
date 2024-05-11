import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'has_session/has_session.dart';
import 'no_session/no_session.dart';
import 'root_router/root_router.dart';

class HomeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];

  @override
  exportedBinds(i) {
    i.add<HomeScreenRootRouterWidgetsCoordinator>(
      () => HomeScreenRootRouterWidgetsCoordinator(
        beachWaves: BeachWavesStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<CompassAndQrGuideWidgetsCoordinator>(
      () => CompassAndQrGuideWidgetsCoordinator(
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        secondaryErrorSmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        primaryInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        secondaryInstructionalGradientNokhte:
            InstructionalGradientNokhteStore(),
      ),
    );
    i.add<QrNavigationReminderWidgetsCoordinator>(
      () => QrNavigationReminderWidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        primaryInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        secondaryInstructionalGradientNokhte:
            InstructionalGradientNokhteStore(),
      ),
    );
    i.add<StorageGuideWidgetsCoordinator>(
      () => StorageGuideWidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        primaryInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        secondaryInstructionalGradientNokhte:
            InstructionalGradientNokhteStore(),
      ),
    );
    i.add<CompassAndStorageGuideWidgetsCoordinator>(
      () => CompassAndStorageGuideWidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        primaryInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        secondaryInstructionalGradientNokhte:
            InstructionalGradientNokhteStore(),
      ),
    );
    i.add<ShortQrGuideWidgetsCoordinator>(
      () => ShortQrGuideWidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        primaryInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        secondaryInstructionalGradientNokhte:
            InstructionalGradientNokhteStore(),
      ),
    );
    i.add<QrAndStorageAdeptWidgetsCoordinator>(
      () => QrAndStorageAdeptWidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        primaryInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        secondaryInstructionalGradientNokhte:
            InstructionalGradientNokhteStore(),
      ),
    );
  }
}
