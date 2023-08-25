// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state

import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/utils/get_current_water_animation.dart';
import 'canvas/beach_waves_painter.dart';
import 'package:simple_animations/simple_animations.dart';

class DumbBeachWaves extends StatelessWidget {
  final MovieTween movie;
  const DumbBeachWaves({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MirrorAnimationBuilder(
        tween: movie,
        duration: movie.duration,
        builder: (context, value, child) {
          final currentAnimationValues = GetCurrentWaterAnimation.values(value);
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
