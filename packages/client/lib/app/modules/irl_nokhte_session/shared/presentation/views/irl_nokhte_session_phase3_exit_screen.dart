// ignore_for_file: must_be_immutable
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/presentation/presentation.dart';

class IrlNokhteSessionPhase3Screen extends HookWidget {
  final IrlNokhteSessionPhase3Coordinator coordinator;
  const IrlNokhteSessionPhase3Screen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    final size = useSquareSize(relativeLength: .20);
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
            GestureCross(
              config: GestureCrossConfiguration(
                top: Right(
                  NokhteGradientConfig(
                    gradientType: NokhteGradientTypes.vibrantBlue,
                  ),
                ),
              ),
              size: size,
              store: coordinator.widgets.gestureCross,
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
