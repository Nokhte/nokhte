// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class HomeScreenRootRouterScreen extends HookWidget {
  final HomeScreenRootRouterCoordinator coordinator;
  const HomeScreenRootRouterScreen({
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
      body: MultiHitStack(
        children: [
          Hero(
            tag: "beach",
            child: FullScreen(
                child: BeachWaves(
              store: coordinator.widgets.beachWaves,
            )),
          ),
          GestureCross(
            config: GestureCrossConfiguration(),
            size: size,
            store: coordinator.widgets.gestureCross,
          ),
          WifiDisconnectOverlay(
            store: coordinator.widgets.wifiDisconnectOverlay,
          ),
        ],
      ),
      // ),
    );
  }
}
