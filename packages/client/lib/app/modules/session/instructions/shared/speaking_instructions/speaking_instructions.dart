export 'session_speaking_instructions_coordinator.dart';
export 'session_speaking_instructions_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

class SessionSpeakingInstructionsScreen extends HookWidget {
  final SessionSpeakingInstructionsCoordinator coordinator;
  const SessionSpeakingInstructionsScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
    }, []);
    final screenSize = useFullScreenSize();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Tap(
        store: coordinator.tap,
        child: Hold(
          store: coordinator.hold,
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
                    opacityDuration: Seconds.get(1),
                    topPadding: coordinator.widgets.smartTextTopPaddingScalar,
                    topBump: .0015,
                    bottomPadding:
                        coordinator.widgets.smartTextBottomPaddingScalar,
                    subTextPadding: useScaledSize(
                      baseValue:
                          coordinator.widgets.smartTextSubMessagePaddingScalar,
                      screenSize: screenSize,
                      bumpPerHundredth: .0005,
                    ),
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
      ),
      // ),
    );
  }
}
