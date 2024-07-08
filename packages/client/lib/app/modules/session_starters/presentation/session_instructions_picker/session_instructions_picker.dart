export "session_instructions_picker_coordinator.dart";
export "session_instructions_picker_widgets_coordinator.dart";
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class SessionInstructionsPickerScreen extends HookWidget {
  final SessionInstructionsPickerCoordinator coordinator;
  const SessionInstructionsPickerScreen({
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
        body: MultiHitStack(
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
            Tint(
              store: coordinator.widgets.tint,
            ),
            Tint(
              store: coordinator.widgets.tint,
            ),
            ChoiceText(
              store: coordinator.widgets.choiceText,
            ),
            ChoiceButtons(
              store: coordinator.widgets.choiceButtons,
            ),
            GestureCross(
              showGlowAndOutline: true,
              config: GestureCrossConfiguration(
                bottom: Right(
                  NokhteGradientConfig(
                    gradientType: NokhteGradientTypes.home,
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
        // ),
      );
    });
  }
}
