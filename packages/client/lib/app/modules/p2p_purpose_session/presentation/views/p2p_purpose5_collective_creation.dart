import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
// import 'package:swipe/swipe.dart';

class P2PPurpose5CollectiveCreation extends StatelessWidget {
  final P2PPurposePhase5CoordinatorStore coordinator;
  P2PPurpose5CollectiveCreation({
    super.key,
    required this.coordinator,
  }) {
    //
    coordinator.screenConstructor();
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
            trackerStore: coordinator.swipe,
            // onSwipeUp: () => coordinator.swipeUpCallback(),
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
                  child: CollaborativeTextEditor(
                    fadeInDuration: Seconds.get(1),
                    trackerStore: coordinator.collaborativeTextUI,
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
              ],
            ),
          ))),
    );
    // });
  }
}
