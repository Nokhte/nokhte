import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/presentation.dart';

class PerspectivesSessionScreen extends StatelessWidget {
  final P2PPerspectiveSessionCoordinatorStore coordinator;
  PerspectivesSessionScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.screenConstructor();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .30,
    );
    return Observer(
      builder: (context) => LayoutBuilder(
        builder: (contexts, constraints) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Swipe(
            trackerStore: coordinator.swipe,
            child: Stack(
              children: [
                SizedBox(
                  width: constraints.widthConstraints().maxHeight,
                  height: constraints.heightConstraints().maxWidth,
                  child: BeachSky(
                    stateTrackerStore: coordinator.widgets.beachSky,
                  ),
                ),
                Opacity(
                  opacity: coordinator.widgets.beachWavesVisibility ? 0 : 1,
                  child: SizedBox(
                    width: constraints.widthConstraints().maxHeight,
                    height: constraints.heightConstraints().maxWidth,
                    child: BeachHorizonWater(
                      size: MediaQuery.of(context).size,
                      stateTrackerStore: coordinator.widgets.beachHorizonWater,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    PerspectivesMap(
                      size: size,
                      stateTrackerStore: coordinator.widgets.perspectivesMap,
                    ),
                  ],
                ),
                SizedBox(
                  width: constraints.widthConstraints().maxHeight,
                  height: constraints.heightConstraints().maxWidth,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.widgets.beachWaves,
                  ),
                ),
                Center(
                  child: CollaborativeTextEditor(
                    trackerStore: coordinator.widgets.collaborativeTextEditor,
                    fadeInDuration: Seconds.get(1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
