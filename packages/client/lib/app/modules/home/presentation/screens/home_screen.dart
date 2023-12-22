// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator.dart';

class HomeScreen extends HookWidget {
  final HomeScreenCoordinator coordinator;
  const HomeScreen({
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
    return Builder(builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: MultiHitStack(
              children: [
                FullScreen(
                    child: BeachWaves(
                  store: coordinator.widgets.beachWaves,
                )),
                FullScreen(
                  child: NokhteBlur(
                    store: coordinator.widgets.nokhteBlur,
                  ),
                ),
                Center(
                    child: SmartText(
                  store: coordinator.widgets.smartText,
                )),
                GestureCross(
                  size: size,
                  store: coordinator.widgets.gestureCross,
                ),
                FullScreen(
                  child: WifiDisconnectOverlay(
                    store: coordinator.widgets.wifiDisconnectOverlay,
                  ),
                ),
              ],
            ),
            // ),
          );
        },
      );
    });
  }
}
