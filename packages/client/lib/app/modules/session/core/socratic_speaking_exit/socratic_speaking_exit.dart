import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';

export 'socratic_speaking_exit_coordinator.dart';
export 'socratic_speaking_exit_widgets_coordinator.dart';

class SocraticSpeakingExitScreen extends HookWidget {
  final SocraticSpeakingExitCoordinator coordinator;
  const SocraticSpeakingExitScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return () => coordinator.dispose();
    }, []);
    useOnAppLifecycleStateChange(
        (previous, current) => coordinator.onAppLifeCycleStateChange(
              current,
              onResumed: () => coordinator.onResumed(),
              onInactive: () => coordinator.onInactive(),
            ));
    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Swipe(
          store: coordinator.swipe,
          child: MultiHitStack(
            children: [
              FullScreen(
                child: BeachWaves(
                  store: coordinator.widgets.beachWaves,
                ),
              ),
              BorderGlow(store: BorderGlowStore()),
              SmartText(
                store: coordinator.widgets.primarySmartText,
                bottomPadding: .5,
                opacityDuration: Seconds.get(1),
              ),
              SmartText(
                store: coordinator.widgets.secondarySmartText,
                topPadding: .75,
                opacityDuration: Seconds.get(1),
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
    });
  }
}
