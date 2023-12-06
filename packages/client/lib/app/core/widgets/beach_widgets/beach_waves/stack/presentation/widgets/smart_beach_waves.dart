// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/beach_waves_painter.dart';

class SmartBeachWaves extends StatelessWidget {
  final BeachWavesTrackerStore stateTrackerStore;
  const SmartBeachWaves({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Opacity(
        opacity: stateTrackerStore.showWidget ? 1 : 0,
        child: CustomAnimationBuilder(
          tween: stateTrackerStore.movie,
          duration: stateTrackerStore.movie.duration,
          control: stateTrackerStore.control,
          onStarted: () => stateTrackerStore.startAndResetStopWatch(),
          builder: (context, value, child) {
            final currentAnimationValues =
                GetCurrentWaterAnimation.values(value);
            if (stateTrackerStore.movieMode ==
                BeachWaveMovieModes.oceanDiveSetup) {
              stateTrackerStore.teeUpOnShoreToOceanDiveTransition(
                  startingWaterMovement: currentAnimationValues.first);
            } else if (stateTrackerStore.movieMode ==
                BeachWaveMovieModes.backToTheDepthsSetup) {
              stateTrackerStore.teeUpBackToTheDepthsValues(colorGradientsList: [
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
                waterValue: currentAnimationValues.first,
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
        ),
      );
    });
  }
}
