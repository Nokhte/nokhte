import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/coordinators/coordinators.dart';
import 'package:swipe/swipe.dart';

class P2PPurpose1GreeterScreen extends StatelessWidget {
  final P2PPurposePhase1CoordinatorStore coordinator;
  P2PPurpose1GreeterScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructorCallback();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return LayoutBuilder(
      builder: ((context, constraints) => PlatformScaffold(
              body: Swipe(
            onSwipeUp: () async => coordinator.swipeUpCallback(),
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.beachWaves,
                  ),
                ),
                Center(
                  child: SmartFadingAnimatedText(
                    initialFadeInDelay: Seconds.get(0),
                    stateTrackerStore: coordinator.fadingText,
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        GesturePill(
                          size: size,
                          stateTrackerStore: coordinator.gesturePillStore,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                  ],
                ),
                // Container(
                //   padding: const EdgeInsets.only(bottom: 40.0),
                //   alignment: Alignment.bottomCenter,
                //   child: FadeInAndChangeColorText(
                //     stateStore: coordinator.fadeInColorText,
                //   ),
                // ),
              ],
            ),
          ))),
    );
    // });
  }
}
