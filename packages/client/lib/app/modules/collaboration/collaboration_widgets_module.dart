import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';

class CollaborationWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        WifiDisconnectOverlayModule(),
        GestureCrossModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<NokhteSessionQrJoinWidgetsCoordinator>(
      () => NokhteSessionQrJoinWidgetsCoordinator(
        qrCode: NokhteQrCodeStore(),
        nokhteBlur: NokhteBlurStore(),
        touchRipple: TouchRippleStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        primaryBeachWaves: BeachWavesStore(),
        secondaryBeachWaves: BeachWavesStore(),
        smartText: SmartTextStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        instructionalGradientNokhte: InstructionalGradientNokhteStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
      ),
    );
    i.add<CollaboratorPoolScreenWidgetsCoordinator>(
      () => CollaboratorPoolScreenWidgetsCoordinator(
        beachWaves: BeachWavesStore(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
        waitingText: WaitingTextStore(),
      ),
    );
  }
}
