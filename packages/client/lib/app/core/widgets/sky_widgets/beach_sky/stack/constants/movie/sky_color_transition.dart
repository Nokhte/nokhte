import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SkyColorTransition {
  static MovieTween getMovie(
    List<Color> startingGrad,
    List<Color> endingGrad,
    bool shouldBeLonger,
  ) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: shouldBeLonger ? Seconds.get(3) : Seconds.get(1),
        )
            .tween(
              'sky value',
              Tween<double>(
                begin: 510.0,
                end: 510.0,
              ),
            )
            .tween(
              'first color',
              ColorTween(
                begin: startingGrad[0],
                end: endingGrad[0],
              ),
            )
            .tween(
              'second color',
              ColorTween(
                begin: startingGrad[1],
                end: endingGrad[1],
              ),
            )
            .tween(
              'third color',
              ColorTween(
                begin: startingGrad[2],
                end: endingGrad[2],
              ),
            )
            .tween(
              'fourth color',
              ColorTween(
                begin: startingGrad[3],
                end: endingGrad[3],
              ),
            );
}
