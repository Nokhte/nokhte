import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

export 'session_speaking_root_router_coordinator.dart';
export 'session_speaking_root_router_widgets_coordinator.dart';
import 'root_router.dart';

class SessionSpeakingRootRouterScreen extends HookWidget {
  final SessionSpeakingRootRouterCoordinator coordinator;

  const SessionSpeakingRootRouterScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiHitStack(
          children: [
            FullScreen(
              child: BeachWaves(
                store: coordinator.widgets.beachWaves,
              ),
            ),
            BorderGlow(
              store: BorderGlowStore(),
            ),
            CollaboratorPresenceIncidentsOverlay(
              store: coordinator.presence.incidentsOverlayStore,
            ),
            WifiDisconnectOverlay(
              store: coordinator.widgets.wifiDisconnectOverlay,
            ),
          ],
        ));
  }
}
