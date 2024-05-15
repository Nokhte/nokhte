import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
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
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
    final size = useSquareSize(relativeLength: .20);
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
                MultiplyingNokhte(
                  store: coordinator.widgets.multiplyingNokhte,
                ),
                SmartText(
                  opacityDuration: Seconds.get(1),
                  store: coordinator.widgets.primarySmartText,
                  bottomPadding:
                      height * coordinator.widgets.smartTextBottomPaddingScalar,
                  subTextPadding: height * .2,
                ),
                SmartText(
                  opacityDuration: Seconds.get(1),
                  store: coordinator.widgets.secondarySmartText,
                  bottomPadding: height * .8,
                ),
                SmartText(
                  opacityDuration: Seconds.get(1),
                  store: coordinator.widgets.tertiarySmartText,
                  topPadding: height * .8,
                ),
                FullScreen(
                  child: TouchRipple(
                    store: coordinator.widgets.touchRipple,
                  ),
                ),
                GestureCross(
                  store: coordinator.widgets.gestureCross,
                  size: size,
                  config: GestureCrossConfiguration(),
                ),
                CollaboratorPresenceIncidentsOverlay(
                  store: coordinator.presence.incidentsOverlayStore,
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
