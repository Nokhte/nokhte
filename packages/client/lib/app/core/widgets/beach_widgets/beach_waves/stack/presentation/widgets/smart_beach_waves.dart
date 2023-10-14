// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/beach_widgets/beach_waves/stack/utils/get_current_water_animation.dart';
import '../../../../_shared/types/types.dart';
import '../mobx/beach_waves_tracker_store.dart';
import 'canvas/beach_waves_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class SmartBeachWaves extends StatefulWidget {
  // final Size size;
  final BeachWavesTrackerStore stateTrackerStore;
  const SmartBeachWaves({
    super.key,
    // required this.size,
    required this.stateTrackerStore,
  });

  @override
  _SmartBeachWavesState createState() => _SmartBeachWavesState();
}

class _SmartBeachWavesState extends State<SmartBeachWaves>
    with SingleTickerProviderStateMixin {
  // final Size size;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return CustomAnimationBuilder<Movie>(
        tween: widget.stateTrackerStore.movie,
        duration: widget.stateTrackerStore.movie.duration,
        control: widget.stateTrackerStore.control,
        onCompleted: () =>
            widget.stateTrackerStore.onBeachWavesAnimationCompletion(),
        builder: (context, value, child) {
          final currentAnimationValues = GetCurrentWaterAnimation.values(value);
          if (widget.stateTrackerStore.movieMode == MovieModes.oceanDiveSetup) {
            widget.stateTrackerStore.teeUpOnShoreToOceanDiveTransition(
                startingWaterMovement: currentAnimationValues[0]);
          } else if (widget.stateTrackerStore.movieMode ==
              MovieModes.backToTheDepthsSetup) {
            widget.stateTrackerStore
                .teeUpBackToTheDepthsValues(colorGradientsList: [
              currentAnimationValues[1],
              currentAnimationValues[2],
              currentAnimationValues[3],
              currentAnimationValues[4],
              currentAnimationValues[5],
              currentAnimationValues[6],
              currentAnimationValues[7],
              currentAnimationValues[8],
            ]);
          }
          return CustomPaint(
            painter: BeachWavesPainter(
              waterValue: currentAnimationValues[0],
              firstGradientColor: currentAnimationValues[1],
              secondGradientColor: currentAnimationValues[2],
              thirdGradientColor: currentAnimationValues[3],
              fourthGradientColor: currentAnimationValues[4],
              fifthGradientColor: currentAnimationValues[5],
              sixthGradientColor: currentAnimationValues[6],
              seventhGradientColor: currentAnimationValues[7],
              eighthGradientColor: currentAnimationValues[8],
              firstGradientStop: currentAnimationValues[9],
              secondGradientStop: currentAnimationValues[10],
              thirdGradientStop: currentAnimationValues[11],
              fourthGradientStop: currentAnimationValues[12],
              fifthGradientStop: currentAnimationValues[13],
              sixthGradientStop: currentAnimationValues[14],
              seventhGradientStop: currentAnimationValues[15],
              eighthGradientStop: currentAnimationValues[16],
            ),
            size: MediaQuery.of(context).size,
          );
        },
      );
    });
  }
}
