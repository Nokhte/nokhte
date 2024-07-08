import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_starters.dart';
export 'constants/constants.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';
export 'session_starters_logic.dart';

class SessionStartersWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<SessionInstructionsPickerWidgetsCoordinator>(
      () => SessionInstructionsPickerWidgetsCoordinator(
        choiceText: ChoiceTextStore(),
        tint: TintStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        choiceButtons: ChoiceButtonsStore(),
      ),
    );
    i.add<SessionJoinerWidgetsCoordinator>(
      () => SessionJoinerWidgetsCoordinator(
        swipeGuide: SwipeGuideStore(),
        homeInstructionalNokhte: InstructionalGradientNokhteStore(),
        presetsInstructionalNokhte: InstructionalGradientNokhteStore(),
        nokhteBlur: NokhteBlurStore(),
        touchRipple: TouchRippleStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<SessionJoinerInstructionsWidgetsCoordinator>(
      () => SessionJoinerInstructionsWidgetsCoordinator(
        swipeGuide: SwipeGuideStore(),
        homeInstructionalNokhte: InstructionalGradientNokhteStore(),
        presetsInstructionalNokhte: InstructionalGradientNokhteStore(),
        nokhteBlur: NokhteBlurStore(),
        touchRipple: TouchRippleStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<SessionStarterInstructionsWidgetsCoordinator>(
      () => SessionStarterInstructionsWidgetsCoordinator(
        swipeGuide: SwipeGuideStore(),
        homeInstructionalNokhte: InstructionalGradientNokhteStore(),
        presetsInstructionalNokhte: InstructionalGradientNokhteStore(),
        nokhteBlur: NokhteBlurStore(),
        touchRipple: TouchRippleStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<SessionStarterWidgetsCoordinator>(
      () => SessionStarterWidgetsCoordinator(
        presetIcons: PresetIconsStore(),
        qrCode: NokhteQrCodeStore(),
        nokhteBlur: NokhteBlurStore(),
        touchRipple: TouchRippleStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        homeInstructionalNokhte: InstructionalGradientNokhteStore(),
        presetsInstructionalNokhte: InstructionalGradientNokhteStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<SessionStarterEntryWidgetsCoordinator>(
      () => SessionStarterEntryWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<SessionStarterExitWidgetsCoordinator>(
      () => SessionStarterExitWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }
}
