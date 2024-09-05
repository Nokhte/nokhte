import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class InstructionalGradientNokhteMovie {
  static MovieTween getMovie(
    Size screenSize, {
    required InstructionalNokhtePositions position,
    required GradientNokhteColorways colorway,
    required InstructionalGradientDirections direction,
  }) {
    final offsets = InstructionalNokhteUtils.getOffsets(
      screenSize,
      position: position,
      direction: direction,
    );

    List<ColorAndStop> grad = InstructionalNokhteUtils.getGradient(colorway);
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1, milli: 500),
      )
          .tween(
            'dx',
            Tween<double>(
              begin: offsets.start.dx,
              end: offsets.end.dx,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy',
            Tween<double>(
              begin: offsets.start.dy,
              end: offsets.end.dy,
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
            'radius',
            Tween<double>(
              begin: direction == InstructionalGradientDirections.enlarge
                  ? 4.5
                  : 25,
              end: direction == InstructionalGradientDirections.enlarge
                  ? 25
                  : 4.5,
            ),
          )
      ..scene(
        begin: direction == InstructionalGradientDirections.enlarge
            ? Seconds.get(1, milli: 500)
            : Seconds.get(0),
        end: direction == InstructionalGradientDirections.enlarge
            ? Seconds.get(2)
            : Seconds.get(0, milli: 500),
      ).tween(
          'textOpacity',
          Tween<double>(
            begin: direction == InstructionalGradientDirections.enlarge ? 0 : 1,
            end: direction == InstructionalGradientDirections.enlarge ? 1 : 0,
          ));
  }
}
