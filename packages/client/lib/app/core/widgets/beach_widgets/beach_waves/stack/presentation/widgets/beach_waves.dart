// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'canvas/beach_waves_painter.dart';

class BeachWaves extends StatelessWidget {
  final BeachWavesStore store;
  const BeachWaves({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) => Observer(
      builder: (context) => Opacity(
            opacity: store.currentStore.showWidget ? 1 : 0,
            child: CustomAnimationBuilder(
              tween: store.currentMovie,
              duration: store.currentMovie.duration,
              control: store.currentControl,
              onCompleted: () => store.onCompleted(),
              builder: (context, value, child) {
                final currentAnimationValues =
                    GetCurrentWaterAnimation.values(value);
                if (store.movieMode ==
                    BeachWaveMovieModes.onShoreToOceanDiveSetup) {
                  store.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
                  store.currentStore.initMovie(currentAnimationValues.first);
                } else if (store.movieMode ==
                    BeachWaveMovieModes.timesUpDynamicPointToTheDepthsSetup) {
                  store.setPivotColors(currentAnimationValues);
                  store.setMovieMode(
                      BeachWaveMovieModes.timesUpDynamicPointToTheDepths);
                  store.currentStore.initMovie(store.pivotColors);
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
          ));
}
