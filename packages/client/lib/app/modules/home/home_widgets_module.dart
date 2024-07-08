import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'home.dart';

class HomeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        ConnectivityModule(),
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
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        storageInstructionalNokhte: InstructionalGradientNokhteStore(),
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
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        storageInstructionalNokhte: InstructionalGradientNokhteStore(),
      ),
    );
    i.add<StorageGuideWidgetsCoordinator>(
      () => StorageGuideWidgetsCoordinator(
        swipeGuide: SwipeGuideStore(),
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        storageInstructionalNokhte: InstructionalGradientNokhteStore(),
      ),
    );
    i.add<CompassAndStorageGuideWidgetsCoordinator>(
      () => CompassAndStorageGuideWidgetsCoordinator(
        swipeGuide: SwipeGuideStore(),
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        storageInstructionalNokhte: InstructionalGradientNokhteStore(),
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
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        storageInstructionalNokhte: InstructionalGradientNokhteStore(),
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
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        storageInstructionalNokhte: InstructionalGradientNokhteStore(),
      ),
    );
    i.add<NeedsUpdateWidgetsCoordinator>(
      () => NeedsUpdateWidgetsCoordinator(
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        tint: TintStore(),
        beachWaves: BeachWavesStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        gradientText: NokhteGradientTextStore(),
      ),
    );
  }
}
