// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

class BaseHomeScreen extends HookWidget {
  final BaseHomeScreenCoordinator coordinator;
  final GestureCrossConfiguration gestureCrossConfig;
  final Widget instructionalNokhtes;
  const BaseHomeScreen({
    super.key,
    required this.coordinator,
    required this.gestureCrossConfig,
    required this.instructionalNokhtes,
  });

  @override
  Widget build(BuildContext context) {
    final center = useCenterOffset();
    useEffect(() {
      coordinator.constructor(center);
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
                  config: gestureCrossConfig,
                  store: coordinator.widgets.gestureCross,
                ),
                instructionalNokhtes,
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
