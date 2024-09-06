export "session_joiner_coordinator.dart";
export "session_joiner_widgets_coordinator.dart";
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class SessionJoinerScreen extends HookWidget {
  final SessionJoinerCoordinator coordinator;
  const SessionJoinerScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final center = useCenterOffset();
    useEffect(() {
      coordinator.constructor(center);
      return () => coordinator.deconstructor();
    }, []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Tap(
        store: coordinator.tap,
        child: Swipe(
          store: coordinator.swipe,
          child: MultiHitStack(
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: FullScreen(
                  child: BeachWaves(
                    opacityDuration: Seconds.get(1),
                    sandType: SandTypes.collaboration,
                    store: coordinator.widgets.beachWaves,
                  ),
                ),
              ),
              QrScanner(
                store: coordinator.widgets.qrScanner,
              ),
              FullScreen(
                child: NokhteBlur(
                  store: coordinator.widgets.nokhteBlur,
                ),
              ),
              Center(
                child: SmartText(
                  store: coordinator.widgets.smartText,
                  opacityDuration: Seconds.get(1),
                  topPadding: .2,
                ),
              ),
              SwipeGuide(
                store: coordinator.widgets.swipeGuide,
                orientations: const [
                  SwipeGuideOrientation.top,
                ],
              ),
              GestureCross(
                showGlowAndOutline: true,
                config: GestureCrossConfiguration(
                  top: Right(EmptySpace()),
                ),
                store: coordinator.widgets.gestureCross,
              ),
              CenterInstructionalNokhte(
                store: coordinator.widgets.centerInstructionalNokhte,
              ),
              InstructionalGradientNokhte(
                store: coordinator.widgets.homeInstructionalNokhte,
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
