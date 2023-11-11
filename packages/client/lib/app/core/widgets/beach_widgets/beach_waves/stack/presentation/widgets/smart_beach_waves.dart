// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'canvas/beach_waves_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class SmartBeachWaves extends StatefulWidget {
  final BeachWavesTrackerStore stateTrackerStore;
  const SmartBeachWaves({
    super.key,
    required this.stateTrackerStore,
  });

  @override
  _SmartBeachWavesState createState() => _SmartBeachWavesState();
}

class _SmartBeachWavesState extends State<SmartBeachWaves>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Opacity(
        opacity: widget.stateTrackerStore.showWidget ? 1 : 0,
        child: CustomAnimationBuilder<Movie>(
          tween: widget.stateTrackerStore.movie,
          duration: widget.stateTrackerStore.movie.duration,
          control: widget.stateTrackerStore.control,
          onCompleted: () =>
              widget.stateTrackerStore.onBeachWavesAnimationCompletion(),
          builder: (context, value, child) {
            final currentAnimationValues =
                GetCurrentWaterAnimation.values(value);
            if (widget.stateTrackerStore.movieMode ==
                BeachWaveMovieModes.oceanDiveSetup) {
              widget.stateTrackerStore.teeUpOnShoreToOceanDiveTransition(
                  startingWaterMovement: currentAnimationValues[0]);
            } else if (widget.stateTrackerStore.movieMode ==
                BeachWaveMovieModes.backToTheDepthsSetup) {
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
        ),
      );
    });
  }
}
