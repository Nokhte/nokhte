import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widget_modules/mirrored_text_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

import 'presentation/presentation.dart';

class SpeakingSessionWidgetsModule extends Module {
  @override
  @override
  List<Module> get imports => [
        MirroredTextModule(),
        WifiDisconnectOverlayModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SessionSpeakingInstructionsWidgetsCoordinator>(
      () => SessionSpeakingInstructionsWidgetsCoordinator(
        holdTimerIndicator: HoldTimerIndicatorStore(),
        tint: TintStore(),
        errorSmartText: SmartTextStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        borderGlow: BorderGlowStore(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionSpeakingWaitingWidgetsCoordinator>(
      () => SessionSpeakingWaitingWidgetsCoordinator(
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionSpeakingWidgetsCoordinator>(
      () => SessionSpeakingWidgetsCoordinator(
        speakLessSmileMore: SpeakLessSmileMoreStore(),
        touchRipple: TouchRippleStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
        borderGlow: BorderGlowStore(),
      ),
    );
  }
}
