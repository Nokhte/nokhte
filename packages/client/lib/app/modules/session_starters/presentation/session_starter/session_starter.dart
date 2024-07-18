export "session_starter_coordinator.dart";
export "session_starter_widgets_coordinator.dart";
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'session_starter_coordinator.dart';

class SessionStarterScreen extends HookWidget {
  final SessionStarterCoordinator coordinator;
  const SessionStarterScreen({
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
                FullScreen(
                  child: NokhteBlur(
                    store: coordinator.widgets.nokhteBlur,
                  ),
                ),
                FullScreen(
                  child: TouchRipple(
                    store: coordinator.widgets.touchRipple,
                  ),
                ),
                NokhteQrCode(
                  store: coordinator.widgets.qrCode,
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.qrSubtitleSmartText,
                    opacityDuration: Seconds.get(1),
                    topPadding: height * .23,
                  ),
                ),
                FullScreen(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .33),
                      child: PresetIcons(
                        store: coordinator.widgets.presetIcons,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SmartText(
                    store: coordinator.widgets.smartText,
                    opacityDuration: Seconds.get(1),
                    topPadding:
                        height * coordinator.widgets.smartTextTopPaddingScalar,
                    bottomPadding: height *
                        coordinator.widgets.smartTextBottomPaddingScalar,
                    subTextPadding:
                        coordinator.widgets.smartTextSubMessagePaddingScalar,
                  ),
                ),
                GestureCross(
                  showGlowAndOutline: true,
                  config: coordinator.widgets.gestureCrossConfig,
                  store: coordinator.widgets.gestureCross,
                ),
                CenterInstructionalNokhte(
                  store: coordinator.widgets.centerInstructionalNokhte,
                ),
                InstructionalGradientNokhte(
                  store: coordinator.widgets.sessionJoinerInstructionalNokhte,
                ),
                InstructionalGradientNokhte(
                  store: coordinator.widgets.presetsInstructionalNokhte,
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
    });
  }
}
