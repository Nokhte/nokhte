import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/individual_session/presentation/mobx/coordinators/individual_session_screen_coordinator.dart';

class IndividualSessionScreen extends StatelessWidget {
  final IndividualSessionScreenCoordinatorStore coordinator;
  IndividualSessionScreen({
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
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BeachSky(
                    stateTrackerStore: coordinator.widgets.beachSky,
                  ),
                ),
                Opacity(
                  opacity: coordinator.widgets.beachWavesVisibility ? 0 : 1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
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
                Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    AudioClipPlatform(
                      size: size,
                      stateTrackerStore: coordinator.widgets.audioClipPlatform,
                    ),
                  ],
                ),
                Center(
                  child: CollaborativeTextEditor(
                    trackerStore: coordinator.widgets.collaborativeTextEditor,
                    fadeInDuration: Seconds.get(1),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SmartBeachWaves(
                    stateTrackerStore: coordinator.widgets.beachWaves,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BeachHorizonWater(
                    size: MediaQuery.of(context).size,
                    stateTrackerStore: coordinator.widgets.audioRecordingWater,
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
