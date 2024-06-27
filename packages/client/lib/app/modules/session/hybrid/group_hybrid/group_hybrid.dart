export 'session_group_hybrid_coordinator.dart';
export 'session_group_hybrid_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_group_hybrid_coordinator.dart';

class SessionGroupHybridScreen extends HookWidget {
  final SessionGroupHybridCoordinator coordinator;
  const SessionGroupHybridScreen({
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
        (previous, current) => coordinator.base.onAppLifeCycleStateChange(
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
          child: Hold(
            store: coordinator.hold,
            child: MultiHitStack(
              children: [
                FullScreen(
                  child: BeachWaves(
                    store: coordinator.widgets.beachWaves,
                  ),
                ),
                HalfScreenTint(
                  store: coordinator.widgets.othersAreTalkingTint,
                ),
                BorderGlow(
                  store: coordinator.widgets.borderGlow,
                ),
                MirroredText(
                  store: coordinator.widgets.mirroredText,
                ),
                SpeakLessSmileMore(
                  store: coordinator.widgets.speakLessSmileMore,
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
      ),
      // ),
    );
  }
}
