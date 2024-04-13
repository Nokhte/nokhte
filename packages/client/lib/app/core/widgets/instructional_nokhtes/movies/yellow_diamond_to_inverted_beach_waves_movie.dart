import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class YellowDiamondToDevelopedGradientMovie {
  static MovieTween getMovie(
    Offset screenCenter, {
    required InstructionalNokhtePositions position,
    required GradientNokhteColorways colorway,
  }) {
    final offsets = InstructionalNokhteUtils.getOffsets(
      screenCenter,
      position: position,
      direction: InstructionalGradientDirections.shrink,
    );
    final endingGrad = InstructionalNokhteUtils.getGradient(colorway);
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1, milli: 500),
      )
          .tween(
              'dx',
              Tween<double>(
                begin: offsets.start.dx,
                end: offsets.start.dx,
              ))
          .tween(
            'dy',
            Tween<double>(
              begin: offsets.start.dy,
              end: offsets.start.dy,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'color1',
            ColorTween(
              begin: const Color(0xFFD8FF18),
              end: endingGrad[0].color,
            ),
          )
          .tween(
            'color2',
            ColorTween(
              begin: const Color(0xFFE0F66E),
              end: endingGrad[1].color,
            ),
          )
          .tween(
            'color3',
            ColorTween(
              begin: const Color(0xFFEEEE41),
              end: endingGrad[2].color,
            ),
          )
          .tween(
            'color4',
            ColorTween(
              begin: const Color(0xFFFDE30E),
              end: endingGrad[3].color,
            ),
          )
          .tween(
            'stop1',
            Tween<double>(
              begin: 0.0,
              end: endingGrad[0].stop,
            ),
          )
          .tween(
            'stop2',
            Tween<double>(
              begin: 0.52,
              end: endingGrad[1].stop,
            ),
          )
          .tween(
            'stop3',
            Tween<double>(
              begin: 0.69,
              end: endingGrad[2].stop,
            ),
          )
          .tween(
            'stop4',
            Tween<double>(
              begin: 1.0,
              end: endingGrad[3].stop,
            ),
          )
          .tween(
            'borderRadius',
            Tween<double>(
              begin: 10,
              end: 100,
            ),
          )
          .tween(
            'radius',
            Tween<double>(
              begin: 25,
              end: 25,
            ),
          );
  }
}
