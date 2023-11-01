import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class HorizonToFullSky {
  static MovieTween getMovie(List<ColorAndStop> startingGradient) =>
      MovieTween()
        ..scene(begin: Seconds.get(0), end: Seconds.get(3))
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: startingGradient[0].color,
                end: startingGradient[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: startingGradient[1].color,
                end: startingGradient[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: startingGradient[2].color,
                end: startingGradient[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: startingGradient[3].color,
                end: startingGradient[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: startingGradient[4].color,
                end: startingGradient[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: startingGradient[5].color,
                end: startingGradient[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: startingGradient[6].color,
                end: startingGradient[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: startingGradient[7].color,
                end: startingGradient[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[0].stop,
                end: startingGradient[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[1].stop,
                end: startingGradient[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[2].stop,
                end: startingGradient[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[3].stop,
                end: startingGradient[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[4].stop,
                end: startingGradient[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[5].stop,
                end: startingGradient[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[6].stop,
                end: startingGradient[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[7].stop,
                end: startingGradient[7].stop,
              ),
            )
            .tween(
              'water value',
              Tween<double>(
                begin: 500,
                end: 900,
              ),
            );
}
