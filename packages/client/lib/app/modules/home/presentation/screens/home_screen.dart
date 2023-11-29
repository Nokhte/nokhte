// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:nokhte/app/core/widgets/smart_fading_animated_text/stack/constants/types/gestures.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator_store.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenCoordinatorStore coordinator;
  const HomeScreen({
    super.key,
    required this.coordinator,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    widget.coordinator.homeScreenConstructorCallback();
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    return Builder(builder: (context) {
      // widget.coordinator.isNavigating;
      return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: GestureDetector(
              onDoubleTap: () => widget.coordinator.fadingTextStateTrackerStore
                  .togglePause(gestureType: Gestures.doubleTap),
              onTap: () => widget.coordinator.fadingTextStateTrackerStore
                  .togglePause(gestureType: Gestures.tap),
              child: Hold(
                trackerStore: widget.coordinator.hold,
                child: Swipe(
                  trackerStore: widget.coordinator.swipe,
                  child: Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: NewSmartBeachWaves(
                            store: widget.coordinator.newBeachWave,
                          )
                          // child: SmartBeachWaves(
                          //   stateTrackerStore: widget.coordinator.beachWaves,
                          // ),
                          ),
                      Center(
                        child: SmartFadingAnimatedText(
                          stateTrackerStore:
                              widget.coordinator.fadingTextStateTrackerStore,
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
                                    widget.coordinator.gesturePillStore,
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
        },
      );
    });
  }
}
