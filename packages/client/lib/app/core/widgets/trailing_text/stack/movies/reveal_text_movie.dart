import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class RevealTextMovie {
  static MovieTween getMovie(
    TextRevealDirection revealDirection,
    double textLength,
  ) {
    double leftPadding = 0.0;
    double rightPadding = 0.0;
    switch (revealDirection) {
      case TextRevealDirection.fromLeft:
        rightPadding = textLength;
      case TextRevealDirection.fromRight:
        leftPadding = textLength;
      default:
        break;
    }
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
            'leftPadding',
            Tween<double>(
              begin: rightPadding,
              end: leftPadding + 15,
            ),
          )
          .tween(
            'rightPadding',
            Tween<double>(
              begin: leftPadding,
              end: rightPadding + 15,
            ),
          );
  }
}
