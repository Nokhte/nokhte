export "session_starter_entry_coordinator.dart";
export "session_starter_entry_widgets_coordinator.dart";
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_starter_entry_coordinator.dart';

class SessionStarterEntryScreen extends HookWidget {
  final SessionStarterEntryCoordinator coordinator;
  const SessionStarterEntryScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
    }, []);

    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiHitStack(
          children: [
            RotatedBox(
              quarterTurns: 2,
              child: FullScreen(
                child: BeachWaves(
                  sandType: SandTypes.collaboration,
                  store: coordinator.widgets.beachWaves,
                ),
              ),
            ),
            GestureCross(
              config: GestureCrossConfiguration(),
              store: coordinator.widgets.gestureCross,
            ),
            WifiDisconnectOverlay(
              store: coordinator.widgets.wifiDisconnectOverlay,
            ),
          ],
        ),
        // ),
      );
    });
  }
}
