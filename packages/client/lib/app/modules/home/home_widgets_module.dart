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
        swipeGuide: SwipeGuideStore(),
        nokhteBlur: NokhteBlurStore(),
        smartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        focusInstructionalNokhte: InstructionalGradientNokhteStore(),
      ),
    );
    i.add<QrNavigationReminderWidgetsCoordinator>(
      () => QrNavigationReminderWidgetsCoordinator(
        nokhteBlur: NokhteBlurStore(),
        smartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
      ),
    );
    i.add<StorageGuideWidgetsCoordinator>(
      () => StorageGuideWidgetsCoordinator(
        swipeGuide: SwipeGuideStore(),
        nokhteBlur: NokhteBlurStore(),
        smartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        touchRipple: TouchRippleStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        sessionStarterInstructionalNokhte: InstructionalGradientNokhteStore(),
        focusInstructionalNokhte: InstructionalGradientNokhteStore(),
      ),
    );
    i.add<QrAndStorageAdeptWidgetsCoordinator>(
      () => QrAndStorageAdeptWidgetsCoordinator(
        nokhteBlur: NokhteBlurStore(),
        smartText: SmartTextStore(),
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
