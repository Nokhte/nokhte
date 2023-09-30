// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
import 'package:swipe/swipe.dart';

class P2PPurpose2ConsultationScreen extends StatelessWidget {
  final P2PPurposePhase2CoordinatorStore coordinator;
  P2PPurpose2ConsultationScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .50,
    );
    return LayoutBuilder(
      builder: ((context, constraints) => PlatformScaffold(
              body: Swipe(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.beachWaves,
                  ),
                ),
                // Observer(
                //   builder: (context) {
                //     return
                Center(
                  child: SmartFadingAnimatedText(
                    initialFadeInDelay: const Duration(seconds: 0),
                    stateTrackerStore: coordinator.fadingText,
                  ),
                ),
                //   },
                // ),
                Column(
                  children: [
                    Expanded(
                      child:
                          Container(), // Empty SizedBox to take up available space
                    ),
                    GestureDetector(
                      onLongPressStart: (_) =>
                          coordinator.breathingPentagonsHoldStartCallback(),
                      onLongPressEnd: (_) {
                        coordinator.breathingPentagonsHoldEndCallback();
                      },
                      child: Container(
                        height: size.height,
                        width: size.width,
                        child: Center(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: BreathingPentagonsButton(
                            fadeInDelay: const Duration(seconds: 1),
                            fadeInDuration: const Duration(seconds: 1),
                            size: size,
                            stateTrackerStore: coordinator.breathingPentagons,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                  ],
                ),
              ],
            ),
          ))),
    );
    // });
  }
}
