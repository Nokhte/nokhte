import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class TwoSecondBeachTransitionMovie {
  static bool get shouldPaintSand => true;
  static MovieTween getMovie(
    MovieTween movie,
    List<ColorAndStop> startingColors,
    List<ColorAndStop> endingColors, {
    Duration start = const Duration(seconds: 0),
    Duration end = const Duration(seconds: 2),
    String prefix = '',
  }) =>
      movie
        ..scene(
          begin: start,
          end: end,
        )
            .tween(
              prefix + BeachWaveAnimationKeys.waterMovement,
              Tween<double>(
                begin: 100,
                end: 100,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color1,
              ColorTween(
                begin: startingColors.first.color,
                end: endingColors.first.color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color2,
              ColorTween(
                begin: startingColors[1].color,
                end: endingColors[1].color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color3,
              ColorTween(
                begin: startingColors[2].color,
                end: endingColors[2].color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color4,
              ColorTween(
                begin: startingColors[3].color,
                end: endingColors[3].color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color5,
              ColorTween(
                begin: startingColors[4].color,
                end: endingColors[4].color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color6,
              ColorTween(
                begin: startingColors[5].color,
                end: endingColors[5].color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color7,
              ColorTween(
                begin: startingColors[6].color,
                end: endingColors[6].color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.color8,
              ColorTween(
                begin: startingColors[7].color,
                end: endingColors[7].color,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop1,
              Tween<double>(
                begin: startingColors.first.stop,
                end: endingColors.first.stop,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop2,
              Tween<double>(
                begin: startingColors[1].stop,
                end: endingColors[1].stop,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop3,
              Tween<double>(
                begin: startingColors[2].stop,
                end: endingColors[2].stop,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop4,
              Tween<double>(
                begin: startingColors[3].stop,
                end: endingColors[3].stop,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop5,
              Tween<double>(
                begin: startingColors[4].stop,
                end: endingColors[4].stop,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop6,
              Tween<double>(
                begin: startingColors[5].stop,
                end: endingColors[5].stop,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop7,
              Tween<double>(
                begin: startingColors[6].stop,
                end: endingColors[6].stop,
              ),
            )
            .tween(
              prefix + BeachWaveAnimationKeys.stop8,
              Tween<double>(
                begin: startingColors[7].stop,
                end: endingColors[7].stop,
              ),
            );
}
