import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presentation/presentation.dart';

class StorageWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        GestureCrossModule(),
        WifiDisconnectOverlayModule(),
      ];
  @override
  exportedBinds(i) {
    i.add<StorageHomeWidgetsCoordinator>(
      () => StorageHomeWidgetsCoordinator(
        sessionCard: SessionCardStore(),
        smartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<StorageContentWidgetsCoordinator>(
      () => StorageContentWidgetsCoordinator(
        contentCard: ContentCardStore(),
        smartText: SmartTextStore(),
        beachWaves: BeachWavesStore(),
        gestureCross: Modular.get<GestureCrossStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
  }
}
