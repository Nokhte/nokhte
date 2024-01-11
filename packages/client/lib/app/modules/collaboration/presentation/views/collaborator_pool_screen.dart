import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';

class CollaboratorPoolScreen extends HookWidget {
  final CollaboratorPoolScreenCoordinator coordinator;
  const CollaboratorPoolScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => null,
              onInactive: () => coordinator.widgets.onInactive(),
              onDetached: () => coordinator.exitThePool(),
            ));
    final size = useSquareSize(relativeLength: .20);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiHitStack(
        children: [
          FullScreen(
              child: BeachWaves(
            store: coordinator.widgets.beachWaves,
          )),
          GestureCross(
            config: GestureCrossConfiguration(),
            size: size,
            store: coordinator.widgets.gestureCross,
          ),
          WifiDisconnectOverlay(
            store: coordinator.widgets.wifiDisconnectOverlay,
          ),
        ],
      ),
    );
  }
}
