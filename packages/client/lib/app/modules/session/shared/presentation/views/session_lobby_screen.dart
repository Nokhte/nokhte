// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/shared/presentation/presentation.dart';

class SessionLobbyScreen extends HookWidget {
  final SessionLobbyCoordinator coordinator;
  const SessionLobbyScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
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
      body: Tap(
        store: coordinator.tap,
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
                topPadding: height * .29,
                opacityDuration: Seconds.get(1),
              ),
            ),
            NokhteQrCode(
              store: coordinator.widgets.qrCode,
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
