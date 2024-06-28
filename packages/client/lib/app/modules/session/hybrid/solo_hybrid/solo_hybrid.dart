export 'session_solo_hybrid_coordinator.dart';
export 'session_solo_hybrid_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_solo_hybrid_coordinator.dart';

class SessionSoloHybridScreen extends HookWidget {
  final SessionSoloHybridCoordinator coordinator;
  const SessionSoloHybridScreen({
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
              Center(
                child: SmartText(
                  store: coordinator.widgets.secondarySmartText,
                  bottomPadding: height * .3,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.primarySmartText,
                  topPadding: height * .3,
                  opacityDuration: Seconds.get(1),
                ),
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
      // ),
    );
  }
}
