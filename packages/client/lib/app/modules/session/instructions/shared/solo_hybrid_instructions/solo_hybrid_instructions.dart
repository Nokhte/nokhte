export 'solo_hybrid_instructions_coordinator.dart';
export 'solo_hybrid_instructions_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'solo_hybrid_instructions_coordinator.dart';

class SoloHybridInstructionsScreen extends HookWidget {
  final SoloHybridInstructionsCoordinator coordinator;
  const SoloHybridInstructionsScreen({
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
        child: MultiHitStack(
          children: [
            FullScreen(
              child: BeachWaves(
                store: coordinator.widgets.beachWaves,
              ),
            ),
            BorderGlow(
              store: coordinator.widgets.borderGlow,
            ),
            FullScreen(
              child: HoldTimerIndicator(
                store: coordinator.widgets.holdTimerIndicator,
              ),
            ),
            Observer(builder: (context) {
              return Center(
                child: SmartText(
                  topPadding:
                      height * coordinator.widgets.smartTextTopPaddingScalar,
                  bottomPadding:
                      height * coordinator.widgets.smartTextBottomPaddingScalar,
                  subTextPadding: height *
                      coordinator.widgets.smartTextSubMessagePaddingScalar,
                  store: coordinator.widgets.smartText,
                ),
              );
            }),
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
