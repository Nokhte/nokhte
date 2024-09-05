import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/presentation.dart';
import 'widgets/widgets.dart';

class StorageWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        GestureCrossModule(),
        ConnectivityModule(),
      ];
  @override
  exportedBinds(i) {
    i.add<StorageHomeWidgetsCoordinator>(
      () => StorageHomeWidgetsCoordinator(
        blur: NokhteBlurStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        homeInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        sessionCard: SessionCardStore(),
        primarySmartText: SmartTextStore(),
        secondarySmartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<StorageContentWidgetsCoordinator>(
      () => StorageContentWidgetsCoordinator(
        blur: NokhteBlurStore(),
        centerInstructionalNokhte: CenterInstructionalNokhteStore(),
        primaryInstructionalGradientNokhte: InstructionalGradientNokhteStore(),
        contentCard: ContentCardStore(),
        smartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }
}
