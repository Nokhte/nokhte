export 'session_exit_coordinator.dart';
export 'session_exit_widgets_coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_exit_coordinator.dart';

class SessionExitScreen extends HookWidget {
  final SessionExitCoordinator coordinator;
  const SessionExitScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    final size = useSquareSize(relativeLength: .20);
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
              Center(
                child: SmartText(
                  store: coordinator.widgets.primarySmartText,
                  bottomPadding: height * .7,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.secondarySmartText,
                  topPadding: height * .8,
                  bottomPadding: 0,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.tertiarySmartText,
                  opacityDuration: Seconds.get(1),
                ),
              ),
              GestureCross(
                config: GestureCrossConfiguration(),
                size: size,
                store: coordinator.widgets.gestureCross,
              ),
              Opacity(
                opacity:
                    useWidgetOpacity(coordinator.showCollaboratorIncidents),
                child: CollaboratorPresenceIncidentsOverlay(
                  store: coordinator.presence.incidentsOverlayStore,
                ),
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
