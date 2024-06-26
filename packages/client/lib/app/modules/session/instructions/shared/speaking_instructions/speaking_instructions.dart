export 'session_speaking_instructions_coordinator.dart';
export 'session_speaking_instructions_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_speaking_instructions_coordinator.dart';

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
              MirroredText(
                store: coordinator.widgets.mirroredText,
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
                store: coordinator.widgets.base.wifiDisconnectOverlay,
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
