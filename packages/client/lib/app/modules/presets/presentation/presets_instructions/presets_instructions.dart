export "presets_instructions_coordinator.dart";
export "presets_instructions_widgets_coordinator.dart";
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presets_instructions_coordinator.dart';

class PresetsInstructionsScreen extends HookWidget {
  final PresetsInstructionsCoordinator coordinator;
  const PresetsInstructionsScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final height = useFullScreenSize().height;
    final center = useCenterOffset();
    useEffect(() {
      coordinator.constructor(center);
      return () => coordinator.deconstructor();
    }, []);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Tap(
        store: coordinator.tap,
        child: MultiHitStack(
          children: [
            RotatedBox(
              quarterTurns: 2,
              child: FullScreen(
                child: BeachWaves(
                  sandType: SandTypes.collaboration,
                  store: coordinator.widgets.beachWaves,
                ),
              ),
            ),
            PresetCards(
              store: coordinator.widgets.presetCards,
            ),
            SmartText(
              store: coordinator.widgets.headerText,
              opacityDuration: Seconds.get(1),
              bottomPadding: height * .75,
            ),
            FullScreen(
              child: NokhteBlur(
                store: coordinator.widgets.blur,
              ),
            ),
            Observer(builder: (context) {
              return Center(
                child: SmartText(
                  store: coordinator.widgets.smartText,
                  opacityDuration: Seconds.get(1),
                  topPadding:
                      height * coordinator.widgets.smartTextTopPaddingScalar,
                  bottomPadding:
                      height * coordinator.widgets.smartTextBottomPaddingScalar,
                  subTextPadding:
                      coordinator.widgets.smartTextSubMessagePaddingScalar,
                ),
              );
            }),
            GestureCross(
              showGlowAndOutline: true,
              config: GestureCrossConfiguration(
                right: Right(
                  NokhteGradientConfig(
                    gradientType: NokhteGradientTypes.sessionStarter,
                  ),
                ),
              ),
              store: coordinator.widgets.gestureCross,
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
