import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';

class IrlNokhteSessionSpeakingScreen extends HookWidget {
  final IrlNokhteSessionSpeakingScreenCoordinator coordinator;
  const IrlNokhteSessionSpeakingScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();

      return null;
    }, []);
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Swipe(
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
