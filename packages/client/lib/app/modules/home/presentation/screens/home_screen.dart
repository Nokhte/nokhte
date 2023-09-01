// home_screen.dart
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/home/presentation/mobx/coordinators/home_screen_coordinator_store.dart';
import 'package:swipe/swipe.dart';

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
    return Observer(builder: (context) {
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
                      stateTrackerStore: coordinator.beachWaveStateTrackerStore,
                    ),
                  ),
                  Center(
                    child: SmartFadingAnimatedText(
                      initialFadeInDelay: const Duration(seconds: 0),
                      stateTrackerStore:
                          coordinator.fadingTextStateTrackerStore,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
