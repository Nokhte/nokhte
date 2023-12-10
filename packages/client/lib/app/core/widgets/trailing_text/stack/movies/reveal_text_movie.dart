import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class RevealTextMovie {
  static MovieTween getMovie(
    TextRevealDirection revealDirection,
    double textLength,
  ) {
    final padding = getPadding(textLength, revealDirection);
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(2),
      )
          .tween(
            'leftPadding',
            Tween<double>(
              begin: padding.right,
              end: padding.left,
            ),
          )
          .tween(
            'rightPadding',
            Tween<double>(
              begin: padding.left,
              end: padding.right,
            ),
          );
  }

  static EdgeInsets getPadding(
    double textLength,
    TextRevealDirection revealDirection,
  ) {
    double leftPadding = 0.0;
    double rightPadding = 0.0;
    switch (revealDirection) {
      case TextRevealDirection.fromLeft:
        rightPadding = textLength + 35;
      case TextRevealDirection.fromRight:
        leftPadding = textLength + 35;
      default:
        break;
    }
    return EdgeInsets.only(
      left: leftPadding,
      right: rightPadding,
    );
  }
}
