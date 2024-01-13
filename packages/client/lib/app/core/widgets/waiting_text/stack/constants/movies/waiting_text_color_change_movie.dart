import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class WaitingTextColorChangeMovie {
  static MovieTween getMovie({required Duration timerLength}) {
    final durationsArr = TimeAllocator.generateWithTransitionPeriods(
      duration: timerLength,
      numIncrements: 2,
      transitionPeriod: Seconds.get(2),
    );
    return MovieTween()
      ..scene(
        begin: durationsArr[1].begin + const Duration(seconds: 14),
        end: durationsArr[1].end + const Duration(seconds: 14),
      ).tween(
        'rectColor',
        ColorTween(
          begin: Colors.white,
          end: WaterColorsAndStops.vibrantBlueGrad.first.color,
        ),
      )
      ..scene(
        begin: durationsArr[1].begin + const Duration(seconds: 8),
        end: durationsArr[1].end + const Duration(seconds: 8),
      ).tween(
        'ripple1Color',
        ColorTween(
          begin: Colors.white,
          end: WaterColorsAndStops.vibrantBlueGrad.first.color,
        ),
      )
      ..scene(
        begin: durationsArr[1].begin - const Duration(seconds: 5),
        end: durationsArr[1].end - const Duration(seconds: 5),
      ).tween(
        'ripple2Color',
        ColorTween(
          begin: Colors.white,
          end: WaterColorsAndStops.vibrantBlueGrad.first.color,
        ),
      );
  }
}
