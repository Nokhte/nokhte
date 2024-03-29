import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/presentation.dart';

class LegacyVirtualNokhteSessionPhase0Greeter extends HookWidget {
  final LegacyVirtualNokhteSessionPhase0Coordinator coordinator;
  const LegacyVirtualNokhteSessionPhase0Greeter({
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
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiHitStack(
        children: [
          FullScreen(
            child: BeachWaves(
              store: coordinator.widgets.beachWaves,
            ),
          ),
          Center(
              child: SmartText(
            store: coordinator.widgets.primarySmartText,
            bottomPadding: 180,
            opacityDuration: Seconds.get(1),
          )),
          WifiDisconnectOverlay(
            store: coordinator.widgets.wifiDisconnectOverlay,
          ),

          // FullScreen(child: BeachWaves(store: coo,))
        ],
      ),
    );
  }
}
