// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/canvas_widget_utils/canvas_widget_utils.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator_store.dart';
import 'package:swipe/swipe.dart';
// import 'package:posthog_flutter/posthog_flutter.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenCoordinatorStore coordinator;
  HomeScreen({
    super.key,
    required this.coordinator,
  }) {
    coordinator.homeScreenConstructorCallback();
    // Posthog().screen(screenName: 'opener screen');
  }

  @override
  Widget build(BuildContext context) {
    final size = CanvasSizeCalculator.squareCanvas(
      context: context,
      percentageLength: .20,
    );
    // return Observer(builder: (context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return PlatformScaffold(
          body: Swipe(
            onSwipeUp: () => coordinator.homeScreenSwipeUpCallback(),
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
                    initialFadeInDelay: const Duration(seconds: 0),
                    stateTrackerStore: coordinator.fadingTextStateTrackerStore,
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
                          stateTrackerStore: coordinator.gestureCross,
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
        );
      },
    );
    // }
    // );
  }
}
