import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'session_paywall.dart';
export 'session_paywall_coordinator.dart';
export 'session_paywall_widgets_coordinator.dart';

class SessionPaywallScreen extends HookWidget {
  final SessionPaywallCoordinator coordinator;
  const SessionPaywallScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
    }, []);
    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Tap(
          store: coordinator.tap,
          child: Swipe(
            store: coordinator.swipe,
            child: MultiHitStack(
              children: [
                FullScreen(
                  child: BeachWaves(
                    store: coordinator.widgets.beachWaves,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: useScaledSize(
                    baseValue: .05,
                    bumpPerHundredth: .005,
                    screenSize: screenSize,
                  )),
                  child: MultiplyingNokhte(
                    store: coordinator.widgets.multiplyingNokhte,
                  ),
                ),
                SmartText(
                  opacityDuration: Seconds.get(1),
                  store: coordinator.widgets.primarySmartText,
                  topPadding: .01,
                  topBump: .002,
                  subTextPadding: useScaledSize(
                    baseValue: .1,
                    bumpPerHundredth: .000001,
                    screenSize: screenSize,
                  ),
                ),
                SmartText(
                  opacityDuration: Seconds.get(1),
                  store: coordinator.widgets.secondarySmartText,
                  bottomPadding: .8,
                ),
                SmartText(
                  opacityDuration: Seconds.get(1),
                  store: coordinator.widgets.tertiarySmartText,
                  topPadding: .8,
                  // topBump: .002,
                ),
                FullScreen(
                  child: TouchRipple(
                    store: coordinator.widgets.touchRipple,
                  ),
                ),
                GestureCross(
                  store: coordinator.widgets.gestureCross,
                  config: GestureCrossConfiguration(),
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
