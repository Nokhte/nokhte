import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_size_calculator.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collective_session/presentation/presentation.dart';

class CollectiveSession2CommitScreen extends StatelessWidget {
  final CollectiveSessionPhase2Coordinator coordinator;
  CollectiveSession2CommitScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return Observer(
      builder: (context) => LayoutBuilder(
        builder: (contexts, constraints) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Swipe(
            trackerStore: coordinator.swipe,
            child: Stack(
              // this also needs the
              children: [
                SizedBox(
                  width: constraints.widthConstraints().maxHeight,
                  height: constraints.heightConstraints().maxWidth,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.widgets.beachWaves,
                  ),
                ),
                Center(
                  child: CollaborativeTextEditor(
                    trackerStore: coordinator.widgets.collaborativeTextUI,
                    fadeInDuration: Seconds.get(1),
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
                          stateTrackerStore:
                              coordinator.widgets.gesturePillStore,
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
          ),
        ),
      ),
    );
  }
}
