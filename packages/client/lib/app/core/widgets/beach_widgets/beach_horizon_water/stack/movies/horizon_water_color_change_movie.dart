import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class HorizonWaterColorChange {
  static MovieTween getMovie(
    List<ColorAndStop> startingGradient,
    List<ColorAndStop> endingGradient,
    bool shouldBeLonger,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: shouldBeLonger ? Seconds.get(3) : Seconds.get(1),
        )
            .tween(
              '1st Water Gradient Color',
              ColorTween(
                begin: startingGradient[0].color,
                end: endingGradient[0].color,
              ),
            )
            .tween(
              '2nd Water Gradient Color',
              ColorTween(
                begin: startingGradient[1].color,
                end: endingGradient[1].color,
              ),
            )
            .tween(
              '3rd Water Gradient Color',
              ColorTween(
                begin: startingGradient[2].color,
                end: endingGradient[2].color,
              ),
            )
            .tween(
              '4th Water Gradient Color',
              ColorTween(
                begin: startingGradient[3].color,
                end: endingGradient[3].color,
              ),
            )
            .tween(
              '5th Water Gradient Color',
              ColorTween(
                begin: startingGradient[4].color,
                end: endingGradient[4].color,
              ),
            )
            .tween(
              '6th Water Gradient Color',
              ColorTween(
                begin: startingGradient[5].color,
                end: endingGradient[5].color,
              ),
            )
            .tween(
              '7th Water Gradient Color',
              ColorTween(
                begin: startingGradient[6].color,
                end: endingGradient[6].color,
              ),
            )
            .tween(
              '8th Water Gradient Color',
              ColorTween(
                begin: startingGradient[7].color,
                end: endingGradient[7].color,
              ),
            )
            .tween(
              '1st Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[0].stop,
                end: endingGradient[0].stop,
              ),
            )
            .tween(
              '2nd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[1].stop,
                end: endingGradient[1].stop,
              ),
            )
            .tween(
              '3rd Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[2].stop,
                end: endingGradient[2].stop,
              ),
            )
            .tween(
              '4th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[3].stop,
                end: endingGradient[3].stop,
              ),
            )
            .tween(
              '5th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[4].stop,
                end: endingGradient[4].stop,
              ),
            )
            .tween(
              '6th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[5].stop,
                end: endingGradient[5].stop,
              ),
            )
            .tween(
              '7th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[6].stop,
                end: endingGradient[6].stop,
              ),
            )
            .tween(
              '8th Water Gradient Stop',
              Tween<double>(
                begin: startingGradient[7].stop,
                end: endingGradient[7].stop,
              ),
            )
            .tween(
              'water value',
              Tween<double>(
                begin: 500.0,
                end: 500.0,
              ),
            );
}
