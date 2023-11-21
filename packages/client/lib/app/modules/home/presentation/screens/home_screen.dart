// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator_store.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenCoordinatorStore coordinator;
  HomeScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.homeScreenConstructorCallback();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return Builder(builder: (context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Hold(
              trackerStore: coordinator.hold,
              child: Swipe(
                trackerStore: coordinator.swipe,
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
                        stateTrackerStore:
                            coordinator.fadingTextStateTrackerStore,
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
              ),
            ),
          );
        },
      );
    });
  }
}
