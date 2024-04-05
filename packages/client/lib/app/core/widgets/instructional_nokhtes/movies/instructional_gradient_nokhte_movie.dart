import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class InstructionalGradientNokhteMovie {
  static MovieTween getMovie(
    Offset screenCenter, {
    required GradientNokhtePositions position,
    required GradientNokhteColorways colorway,
    required InstructionalGradientDirections direction,
  }) {
    double dxStart = -1;
    double dxEnd = -1;
    double dyStart = -1;
    double dyEnd = -1;
    switch (position) {
      case GradientNokhtePositions.left:
        dxStart = CircleOffsets.left.dx;
        dxEnd = CircleOffsets.left.dx;
        dyStart = CircleOffsets.left.dy;
        dyEnd = CircleOffsets.left.dy;
        break;
      case GradientNokhtePositions.right:
        dxStart = CircleOffsets.right.dx;
        dxEnd = CircleOffsets.right.dx;
        dyStart = CircleOffsets.right.dx;
        dyEnd = CircleOffsets.right.dx;
        break;
      case GradientNokhtePositions.top:
        dxStart = CircleOffsets.center.dx;
        dxEnd = CircleOffsets.center.dx;
        switch (direction) {
          case InstructionalGradientDirections.enlarge:
            dyStart = CircleOffsets.top.dy;
            dyEnd = (-screenCenter.dy) * 1.1;
          case InstructionalGradientDirections.shrink:
            dyStart = (-screenCenter.dy) * 1.1;
            dyEnd = CircleOffsets.top.dy;
        }
      case GradientNokhtePositions.bottom:
        dxStart = CircleOffsets.bottom.dx;
        dxEnd = CircleOffsets.bottom.dx;
        switch (direction) {
          case InstructionalGradientDirections.enlarge:
            dyStart = CircleOffsets.top.dy;
            dyEnd = (-screenCenter.dy) * .4;
          case InstructionalGradientDirections.shrink:
            dyStart = (-screenCenter.dy) * .4;
            dyEnd = CircleOffsets.bottom.dy;
        }
    }

    List<ColorAndStop> grad = [];
    switch (colorway) {
      case GradientNokhteColorways.invertedBeachWave:
        grad = const [
          ColorAndStop(Color(0xFFFFE6C4), 0.0),
          ColorAndStop(Color(0xFFFFBC78), .33),
          ColorAndStop(Color(0xFF42FFD9), .4),
          ColorAndStop(Color(0xFF4497C5), 1.0),
        ];
      case GradientNokhteColorways.beachWave:
        grad = const [
          ColorAndStop(Color(0xFF407F74), 0),
          ColorAndStop(Color(0xFF53A28F), .4),
          ColorAndStop(Color(0xFF866243), .4),
          ColorAndStop(Color(0xFFCBB28E), 1),
        ];
    }
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1, milli: 500),
      )
          .tween(
            'dx',
            Tween<double>(
              begin: dxStart,
              end: dxEnd,
            ),
          )
          .tween(
            'dy',
            Tween<double>(
              begin: dyStart,
              end: dyEnd,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'color1',
            ColorTween(
              begin: grad[0].color,
              end: grad[0].color,
            ),
          )
          .tween(
            'color2',
            ColorTween(
              begin: grad[1].color,
              end: grad[1].color,
            ),
          )
          .tween(
            'color3',
            ColorTween(
              begin: grad[2].color,
              end: grad[2].color,
            ),
          )
          .tween(
            'color4',
            ColorTween(
              begin: grad[3].color,
              end: grad[3].color,
            ),
          )
          .tween(
            'stop1',
            Tween<double>(
              begin: grad[0].stop,
              end: grad[0].stop,
            ),
          )
          .tween(
            'stop2',
            Tween<double>(
              begin: grad[1].stop,
              end: grad[1].stop,
            ),
          )
          .tween(
            'stop3',
            Tween<double>(
              begin: grad[2].stop,
              end: grad[2].stop,
            ),
          )
          .tween(
            'stop4',
            Tween<double>(
              begin: grad[3].stop,
              end: grad[3].stop,
            ),
          )
          .tween(
            'borderRadius',
            Tween<double>(
              begin: 100,
              end: 100,
            ),
          )
          .tween(
            'radius',
            Tween<double>(
              begin: direction == InstructionalGradientDirections.enlarge
                  ? 4.5
                  : 25,
              end: direction == InstructionalGradientDirections.enlarge
                  ? 25
                  : 4.5,
            ),
          );
  }
}
