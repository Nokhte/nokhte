export "session_starter_coordinator.dart";
export "session_starter_widgets_coordinator.dart";
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/hooks/hooks.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class SessionStarterScreen extends HookWidget {
  final SessionStarterCoordinator coordinator;
  const SessionStarterScreen({
    super.key,
    required this.coordinator,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = useFullScreenSize();
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
              Observer(builder: (context) {
                return RotatedBox(
                  quarterTurns: 2,
                  child: FullScreen(
                    child: BeachWaves(
                      shouldScrollAdjust: true,
                      scrollPercentage:
                          coordinator.widgets.sessionScroller.scrollPercentage,
                      sandType: SandTypes.collaboration,
                      store: coordinator.widgets.beachWaves,
                    ),
                  ),
                );
              }),
              // fix observer problem
              // i would say move the can scroll into the store instead of here
              SessionScroller(
                store: coordinator.widgets.sessionScroller,
                children: [
                  [
                    Observer(builder: (context) {
                      return Opacity(
                        opacity:
                            coordinator.widgets.hasNotSelectedPreset ? .4 : 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: screenSize.height * .2,
                          ),
                          child: NokhteQrCode(
                            store: coordinator.widgets.qrCode,
                          ),
                        ),
                      );
                    }),
                    SmartText(
                      store: coordinator.widgets.qrSubtitleSmartText,
                      opacityDuration: Seconds.get(1),
                      topPadding: .1,
                      topBump: 0.003,
                    ),
                    PresetHeader(
                      store: coordinator.widgets.presetHeader,
                      scrollPercentage:
                          coordinator.widgets.sessionScroller.scrollPercentage,
                    ),
                  ],
                  [
                    SmartText(
                      store: coordinator.widgets.headerText,
                      opacityDuration: Seconds.get(1),
                      bottomPadding: .6,
                      bottomBump: .004,
                    ),
                    Observer(builder: (context) {
                      return PresetKey(
                        showWidget: !coordinator.widgets.presetIsExpanded,
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.only(
                        top: useScaledSize(
                          baseValue: 0.18,
                          bumpPerHundredth: -0.001,
                          screenSize: screenSize,
                        ),
                      ),
                      child: PresetCards(
                        store: coordinator.widgets.presetCards,
                      ),
                    ),
                  ],
                ],
              ),
              FullScreen(
                child: NokhteBlur(
                  store: coordinator.widgets.nokhteBlur,
                ),
              ),
              GestureCross(
                showGlowAndOutline: true,
                config: GestureCrossConfiguration(
                  bottom: Right(EmptySpace()),
                ),
                store: coordinator.widgets.gestureCross,
              ),
              SwipeGuide(
                store: coordinator.widgets.swipeGuide,
                orientations: const [
                  SwipeGuideOrientation.bottom,
                ],
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
