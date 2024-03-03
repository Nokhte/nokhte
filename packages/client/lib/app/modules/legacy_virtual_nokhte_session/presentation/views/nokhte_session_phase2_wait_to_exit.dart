import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/presentation.dart';

class NokhteSessionPhase2WaitToExit extends HookWidget {
  final NokhteSessionPhase2Coordinator coordinator;
  const NokhteSessionPhase2WaitToExit({
    super.key,
    required this.coordinator,
  });
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    final size = useSquareSize(relativeLength: .20);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Hold(
        store: coordinator.hold,
        child: Swipe(
          store: coordinator.swipe,
          child: MultiHitStack(
            children: [
              FullScreen(
                child: BeachWaves(
                  store: coordinator.widgets.beachWaves,
                ),
              ),
              GestureCross(
                config: GestureCrossConfiguration(),
                showGlowAndOutline: true,
                size: size,
                store: coordinator.widgets.gestureCross,
              ),
              WaitingText(
                store: coordinator.widgets.waitingText,
              ),
              WifiDisconnectOverlay(
                store: coordinator.widgets.wifiDisconnectOverlay,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
