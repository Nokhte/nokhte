export 'session_duo_greeter_coordinator.dart';
export 'session_duo_greeter_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

class SessionDuoGreeterScreen extends HookWidget {
  final SessionDuoGreeterCoordinator coordinator;
  const SessionDuoGreeterScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
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
            Center(
              child: SmartText(
                store: coordinator.widgets.primarySmartText,
                bottomPadding: .05,
                opacityDuration: Seconds.get(1),
              ),
            ),
            Center(
              child: SmartText(
                store: coordinator.widgets.secondarySmartText,
                topPadding: .8,
                bottomPadding: 0,
                opacityDuration: Seconds.get(1),
              ),
            ),
            FullScreen(
              child: TouchRipple(
                store: coordinator.widgets.touchRipple,
              ),
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
      // ),
    );
  }
}
