export "presets_coordinator.dart";
export "presets_widgets_coordinator.dart";
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'presets_coordinator.dart';

class PresetsScreen extends HookWidget {
  final PresetsCoordinator coordinator;
  const PresetsScreen({
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

    return Observer(builder: (context) {
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
                      sandType: SandTypes.collaboration,
                      store: coordinator.widgets.beachWaves,
                    ),
                  ),
                ),
                SmartText(
                  store: coordinator.widgets.headerText,
                  opacityDuration: Seconds.get(1),
                  bottomPadding: .75,
                  bottomBump: .001,
                ),
                PresetCards(
                  store: coordinator.widgets.presetCards,
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
                    topPadding: .15,
                    topBump: 0.001,
                  ),
                ),
                GestureCross(
                  showGlowAndOutline: true,
                  config: GestureCrossConfiguration(
                    right: Right(EmptySpace()),
                  ),
                  store: coordinator.widgets.gestureCross,
                ),
                CenterInstructionalNokhte(
                  store: coordinator.widgets.centerInstructionalNokhte,
                ),
                InstructionalGradientNokhte(
                  store: coordinator.widgets.sessionStarterInstructionalNokhte,
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
    });
  }
}
