import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'waiting_patron.dart';
export 'waiting_patron_coordinator.dart';
export 'waiting_patron_widgets_coordinator.dart';

class WaitingPatronScreen extends HookWidget {
  final WaitingPatronCoordinator coordinator;
  const WaitingPatronScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Tap(
        store: coordinator.tap,
        child: Swipe(
          store: coordinator.swipe,
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
              NokhteGradientText(
                store: coordinator.widgets.nokhteGradientText,
                content: 'Wait for the others',
                gradient: SessionConstants.limeTextGrad,
                padding: EdgeInsets.only(
                  bottom: height * .1,
                ),
              ),
              GestureCross(
                store: coordinator.widgets.gestureCross,
                config: GestureCrossConfiguration(),
              ),
              WifiDisconnectOverlay(
                store: coordinator.widgets.wifiDisconnectOverlay,
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
