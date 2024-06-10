export 'session_half_notes_instructions_coordinator.dart';
export 'session_half_notes_instructions_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_half_notes_instructions_coordinator.dart';

class HalfSessionNotesInstructionsScreen extends HookWidget {
  final HalfSessionNotesInstructionsCoordinator coordinator;
  const HalfSessionNotesInstructionsScreen({
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
        child: MultiHitStack(
          children: [
            FullScreen(
              child: BeachWaves(
                store: coordinator.widgets.beachWaves,
              ),
            ),
            HalfScreenTint(
              store: coordinator.widgets.halfScreenTint,
            ),
            BorderGlow(store: BorderGlowStore()),
            Tint(
              store: coordinator.widgets.tint,
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
      // ),
    );
  }
}