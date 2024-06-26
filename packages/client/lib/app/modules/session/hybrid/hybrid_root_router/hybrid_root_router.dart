import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

export 'session_hybrid_root_router_coordinator.dart';
export 'session_hybrid_root_router_widgets_coordinator.dart';
import 'hybrid_root_router.dart';

class SessionHybridRootRouterScreen extends HookWidget {
  final SessionHybridRootRouterCoordinator coordinator;

  const SessionHybridRootRouterScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
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
            WifiDisconnectOverlay(
              store: coordinator.widgets.wifiDisconnectOverlay,
            ),
          ],
        ));
  }
}
