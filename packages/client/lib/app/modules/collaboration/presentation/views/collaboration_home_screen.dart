import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/gradient_tree_node/stack/constants/tree_node_gradients.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';

class CollaborationHomeScreen extends HookWidget {
  final CollaborationHomeScreenCoordinator coordinator;
  const CollaborationHomeScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Swipe(
        store: coordinator.swipe,
        child: MultiHitStack(
          children: [
            FullScreen(
                child: BeachWaves(
              store: coordinator.widgets.beachWaves,
            )),
            Center(
                child: SmartText(
              store: coordinator.widgets.smartText,
              bottomPadding: 180,
              opacityDuration: Seconds.get(1),
            )),
            FullScreen(
              child: GradientTreeNode(
                store: coordinator.widgets.gradientTreeNode,
                gradient: TreeNodeGradients.yellow,
                padding: const EdgeInsets.only(top: 400.0),
              ),
            ),
            GestureCross(
              config: GestureCrossConfiguration(
                bottom: Right(
                  NokhteGradientConfig(
                    gradientType: NokhteGradientTypes.water,
                  ),
                ),
              ),
              size: size,
              store: coordinator.widgets.gestureCross,
            ),
            WifiDisconnectOverlay(
              store: coordinator.widgets.wifiDisconnectOverlay,
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
