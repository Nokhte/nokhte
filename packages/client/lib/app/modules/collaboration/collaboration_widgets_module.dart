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
    i.add<CollaborationHomeScreenWidgetsCoordinator>(
      () => CollaborationHomeScreenWidgetsCoordinator(
        gestureCross: Modular.get<GestureCrossStore>(),
        beachWaves: Modular.get<BeachWavesStore>(),
        gradientTreeNode: Modular.get<GradientTreeNodeStore>(),
        smartText: Modular.get<SmartTextStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
      ),
    );
    i.add<CollaboratorPoolScreenWidgetsCoordinator>(
      () => CollaboratorPoolScreenWidgetsCoordinator(
        beachWaves: Modular.get<BeachWavesStore>(),
        wifiDisconnectOverlay: Modular.get<WifiDisconnectOverlayStore>(),
        gestureCross: Modular.get<GestureCrossStore>(),
      ),
    );
  }
}
