// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/constants/types/types.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/presentation/mobx/main/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/utils/get_current_water_animation.dart';
import 'canvas/beach_waves_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class BeachWaves extends StatefulWidget {
  // final Size size;
  final BeachWavesTrackerStore stateTrackerStore;
  const BeachWaves({
    super.key,
    // required this.size,
    required this.stateTrackerStore,
  });

  @override
  _BeachWavesState createState() => _BeachWavesState(
        // size: size,
        stateTrackerStore: stateTrackerStore,
      );
}

class _BeachWavesState extends State<BeachWaves>
    with SingleTickerProviderStateMixin {
  // final Size size;
  final BeachWavesTrackerStore stateTrackerStore;

  _BeachWavesState({
    // required this.size,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder<Movie>(
        tween: stateTrackerStore.movie,
        duration: stateTrackerStore.movie.duration,
        control: stateTrackerStore.control,
        onCompleted: () => stateTrackerStore.onBeachWavesAnimationCompletion(),
        builder: (context, value, child) {
          final currentAnimationValues = GetCurrentWaterAnimation.values(value);
          if (stateTrackerStore.movieMode == MovieModes.oceanDiveSetup) {
            stateTrackerStore.teeUpHomeScreenToCollabPoolNavigation(
                startingWaterMovement: currentAnimationValues[0]);
          }
          return CustomPaint(
            painter: BeachWavesPainter(
              waterValue: currentAnimationValues[0],
              firstGradientColor: currentAnimationValues[1],
              secondGradientColor: currentAnimationValues[2],
              thirdGradientColor: currentAnimationValues[3],
              fourthGradientColor: currentAnimationValues[4],
              fifthGradientColor: currentAnimationValues[5],
            ),
            size: MediaQuery.of(context).size,
          );
        },
      );
    });
  }
}
