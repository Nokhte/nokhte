export 'session_information_coordinator.dart';
export 'session_information_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

class SessionInformationScreen extends HookWidget {
  final SessionInformationCoordinator coordinator;
  const SessionInformationScreen({
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
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Tap(
        store: coordinator.tap,
        child: MultiHitStack(
          children: [
            FullScreen(
              child: BeachWaves(
                store: coordinator.widgets.beachWaves,
              ),
            ),
            BorderGlow(store: BorderGlowStore()),
            Tint(
              store: coordinator.widgets.tint,
            ),
            Center(
              child: SmartText(
                store: coordinator.widgets.primarySmartText,
                bottomPadding: .75,
                opacityDuration: Seconds.get(1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: useScaledSize(
                  baseValue: .03,
                  screenSize: screenSize,
                ),
              ),
              child: ExpandedPresetsCards(
                store: coordinator.widgets.presetCard,
              ),
            ),
            FullScreen(
              child: TouchRipple(
                store: coordinator.widgets.touchRipple,
              ),
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
