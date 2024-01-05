import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';

class CollaborationWidgetsModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        WifiDisconnectOverlayModule(),
        SmartTextModule(),
        GestureCrossModule(),
      ];
  @override
  void exportedBinds(Injector i) {
    i.add<GradientTreeNodeStore>(
      () => GradientTreeNodeStore(),
    );
    i.add<CollaborationHomeWidgetsCoordinator>(
      () => CollaborationHomeWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        gradientTreeNode: i<GradientTreeNodeStore>(),
        smartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    //
  }
}
