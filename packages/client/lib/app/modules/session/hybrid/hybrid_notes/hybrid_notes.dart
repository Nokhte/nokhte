export 'session_hybrid_notes_coordinator.dart';
export 'session_hybrid_notes_widgets_coordinator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_hybrid_notes_coordinator.dart';

class SessionHybridNotesScreen extends HookWidget {
  final SessionHybridNotesCoordinator coordinator;
  const SessionHybridNotesScreen({
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
        child: Swipe(
          store: coordinator.swipe,
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
              TouchRipple(
                store: coordinator.widgets.touchRipple,
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.smartText,
                  topPadding: useFullScreenSize().height * .8,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                child: TextEditor(
                  placeholderText: "Your thoughtful thought",
                  store: coordinator.widgets.textEditor,
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
