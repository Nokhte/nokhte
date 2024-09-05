export 'home_coordinator.dart';
export 'home_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

class HomeScreen extends HookWidget {
  final HomeCoordinator coordinator;
  const HomeScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
    }, []);
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Tap(
          store: coordinator.tap,
          child: Swipe(
            store: coordinator.swipe,
            child: MultiHitStack(
              children: [
                Hero(
                  tag: 'beach',
                  child: FullScreen(
                    child: BeachWaves(
                      store: coordinator.widgets.beachWaves,
                    ),
                  ),
                ),
                FullScreen(
                  child: NokhteBlur(
                    store: coordinator.widgets.nokhteBlur,
                  ),
                ),
                FullScreen(
                  child: TouchRipple(
                    store: coordinator.widgets.touchRipple,
                  ),
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.smartText,
                    topPadding: coordinator.widgets.smartTextTopPaddingScalar,
                    // addSubMessageAdjuster: true,
                    topBump: 0.008,
                    bottomPadding:
                        coordinator.widgets.smartTextBottomPaddingScalar,
                    bottomBump: .008,
                    opacityDuration: Seconds.get(1),
                  ),
                ),
                GestureCross(
                  showGlowAndOutline: true,
                  config: GestureCrossConfiguration(),
                  store: coordinator.widgets.gestureCross,
                ),
                SwipeGuide(
                  store: coordinator.widgets.swipeGuides,
                  orientations: const [
                    SwipeGuideOrientation.top,
                    SwipeGuideOrientation.bottom,
                    SwipeGuideOrientation.right,
                  ],
                ),
                CenterInstructionalNokhte(
                  store: coordinator.widgets.centerInstructionalNokhte,
                ),
                InstructionalGradientNokhte(
                  store: coordinator.widgets.sessionStarterInstructionalNokhte,
                ),
                InstructionalGradientNokhte(
                  store: coordinator.widgets.sessionJoinerInstructionalNokhte,
                ),
                InstructionalGradientNokhte(
                  store: coordinator.widgets.storageInstructionalNokhte,
                ),
                WifiDisconnectOverlay(
                  store: coordinator.widgets.wifiDisconnectOverlay,
                ),
              ],
            ),
          ),
        ),
        // ),
      );
    });
  }
}
