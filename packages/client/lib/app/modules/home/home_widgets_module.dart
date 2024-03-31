import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/mobx/mobx.dart';

class HomeWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        CircleExplanationModule(),
        GestureCrossModule(),
      ];

  @override
  exportedBinds(i) {
    i.add<CrossStore>(
      () => CrossStore(),
    );
    i.add<NokhteBlurStore>(
      () => NokhteBlurStore(),
    );
    i.add<HomeScreenPhase0WidgetsCoordinator>(
      () => HomeScreenPhase0WidgetsCoordinator(
        beachWaves: BeachWavesStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<HomeScreenPhase1WidgetsCoordinator>(
      () => HomeScreenPhase1WidgetsCoordinator(
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        secondaryErrorSmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
      ),
    );
    i.add<HomeScreenPhase2WidgetsCoordinator>(
      () => HomeScreenPhase2WidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
      ),
    );
    i.add<HomeScreenPhase3WidgetsCoordinator>(
      () => HomeScreenPhase3WidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
      ),
    );
    i.add<HomeScreenPhase4WidgetsCoordinator>(
      () => HomeScreenPhase4WidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
      ),
    );
    i.add<HomeScreenPhase5WidgetsCoordinator>(
      () => HomeScreenPhase5WidgetsCoordinator(
        secondaryErrorSmartText: SmartTextStore(),
        errorSmartText: SmartTextStore(),
        nokhteBlur: NokhteBlurStore(),
        primarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
      ),
    );
  }
}
