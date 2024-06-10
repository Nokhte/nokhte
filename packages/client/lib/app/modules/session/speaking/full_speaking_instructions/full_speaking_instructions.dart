export 'session_full_speaking_instructions_coordinator.dart';
export 'session_full_speaking_instructions_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_full_speaking_instructions_coordinator.dart';

class FullSessionSpeakingInstructionsScreen extends HookWidget {
  final FullSessionSpeakingInstructionsCoordinator coordinator;
  const FullSessionSpeakingInstructionsScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.deconstructor();
    }, []);
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
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
              Tint(
                store: coordinator.widgets.tint,
              ),
              SmartText(
                opacityDuration: Seconds.get(1),
                store: coordinator.widgets.errorSmartText,
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