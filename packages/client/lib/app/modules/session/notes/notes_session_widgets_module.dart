import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widget_modules/mirrored_text_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/presentation.dart';

class NotesSessionWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        MirroredTextModule(),
        WifiDisconnectOverlayModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<SessionNotesInstructionsWidgetsCoordinator>(
      () => SessionNotesInstructionsWidgetsCoordinator(
        touchRipple: TouchRippleStore(),
        tint: TintStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionNotesWidgetsCoordinator>(
      () => SessionNotesWidgetsCoordinator(
        smartText: SmartTextStore(),
        borderGlow: BorderGlowStore(),
        touchRipple: TouchRippleStore(),
        textEditor: TextEditorStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
    i.add<SessionNotesInactivityWidgetsCoordinator>(
      () => SessionNotesInactivityWidgetsCoordinator(
        borderGlow: BorderGlowStore(),
        mirroredText: Modular.get<MirroredTextStore>(),
        touchRipple: TouchRippleStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        beachWaves: BeachWavesStore(),
      ),
    );
  }
}
