import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';

class IrlNokhteSessionSpeakingInstructionsScreen extends HookWidget {
  final IrlNokhteSessionSpeakingScreenCoordinator coordinator;
  const IrlNokhteSessionSpeakingInstructionsScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Hold(
        store: coordinator.hold,
        child: Swipe(
          store: coordinator.swipe,
          child: MultiHitStack(
            children: [
              FullScreen(
                child: BeachWaves(
                  store: coordinator.widgets.beachWaves,
                ),
              ),
              MirroredText(
                store: coordinator.widgets.mirroredText,
              ),
              // Center(
              //   child: SmartText(
              //     store: coordinator.widgets.primarySmartText,
              //     bottomPadding: height * .05,
              //     opacityDuration: Seconds.get(1),
              //   ),
              // ),
              // Center(
              //   child: SmartText(
              //     store: coordinator.widgets.secondarySmartText,
              //     topPadding: height * .8,
              //     bottomPadding: 0,
              //     opacityDuration: Seconds.get(1),
              //   ),
              // ),
              FullScreen(
                child: TouchRipple(
                  store: coordinator.widgets.touchRipple,
                ),
              ),
              // CollaboratorPresenceIncidentsOverlay(
              //   store: coordinator.presence.incidentsOverlayStore,
              // ),
              // WifiDisconnectOverlay(
              //   store: coordinator.widgets.wifiDisconnectOverlay,
              // ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
