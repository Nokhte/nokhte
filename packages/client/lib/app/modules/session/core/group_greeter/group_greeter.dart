export 'session_group_greeter_coordinator.dart';
export 'session_group_greeter_widgets_coordinator.dart';

// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

class SessionGroupGreeterScreen extends HookWidget {
  final SessionGroupGreeterCoordinator coordinator;
  const SessionGroupGreeterScreen({
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
            Tint(
              store: coordinator.widgets.tint,
            ),
            Center(
              child: SmartText(
                store: coordinator.widgets.primarySmartText,
                bottomPadding: height * .3,
                opacityDuration: Seconds.get(1),
              ),
            ),
            Center(
              child: SmartText(
                store: coordinator.widgets.secondarySmartText,
                topPadding: height * .8,
                bottomPadding: 0,
                opacityDuration: Seconds.get(1),
              ),
            ),
            SessionSeatingGuide(
              store: coordinator.widgets.sessionSeatingGuide,
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
