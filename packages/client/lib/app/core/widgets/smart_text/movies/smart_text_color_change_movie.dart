import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class SmartTextColorChangeMovie {
  static MovieTween getMovie({required Duration timerLength}) {
    final durationsArr = TimeAllocator.generateWithTransitionPeriods(
      duration: timerLength,
      numIncrements: 2,
      transitionPeriod: Seconds.get(1),
    );
    return MovieTween()
      ..scene(
        begin: durationsArr[1].begin + const Duration(seconds: 65),
        end: durationsArr[1].end + const Duration(seconds: 65),
      ).tween(
        'color',
        ColorTween(
          begin: Colors.white,
          end: WaterColorsAndStops.sky.first.color,
        ),
      );
  }
}
