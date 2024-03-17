// ignore_for_file: must_be_immutable
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';

class HomeScreenPhase2DoneInvitationFlowNoSession extends HookWidget {
  final HomeScreenPhase2Coordinator coordinator;
  const HomeScreenPhase2DoneInvitationFlowNoSession({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final size = useSquareSize(relativeLength: .20);
    useEffect(() {
      coordinator.constructor();
      return null;
    }, []);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Swipe(
        store: coordinator.swipe,
        child: MultiHitStack(
          children: [
            Hero(
              tag: 'beach',
              child: FullScreen(
                child: BeachWaves(
                  store: coordinator.widgets.beachWaves,
                ),
              ),
            ),
            FullScreen(
              child: NokhteBlur(
                store: coordinator.widgets.nokhteBlur,
              ),
            ),
            Center(
              child: SmartText(
                store: coordinator.widgets.primarySmartText,
                bottomPadding: 180,
                opacityDuration: Seconds.get(1),
              ),
            ),
            GestureCross(
              config: GestureCrossConfiguration(
                top: Right(
                  NokhteGradientConfig(
                    gradientType: NokhteGradientTypes.oceanDive,
                  ),
                ),
              ),
              size: size,
              store: coordinator.widgets.gestureCross,
            ),
            WifiDisconnectOverlay(
              store: coordinator.widgets.wifiDisconnectOverlay,
            ),
          ],
        ),
      ),
    );
  }
}
