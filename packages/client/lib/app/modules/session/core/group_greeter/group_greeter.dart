export 'session_group_greeter_coordinator.dart';
export 'session_group_greeter_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
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
    return Observer(builder: (context) {
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
              BorderGlow(
                store: BorderGlowStore(),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.primarySmartText,
                  bottomPadding:
                      coordinator.widgets.smartTextBottomPaddingScalar,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.secondarySmartText,
                  topPadding: .8,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              SessionPhonePlacementGuide(
                store: coordinator.widgets.sessionPhonePlacementGuide,
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
    });
  }
}
