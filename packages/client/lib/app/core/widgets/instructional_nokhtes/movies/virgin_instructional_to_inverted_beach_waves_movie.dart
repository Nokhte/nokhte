import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class VirginInstructionalToInvertedBeachWavesMovie {
  static MovieTween getMovie(Offset screenCenter) {
    final pivotPoint = (-screenCenter.dy) * 1.1;
    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1, milli: 500),
      )
          .tween(
              'dx',
              Tween<double>(
                begin: CircleOffsets.center.dx,
                end: CircleOffsets.center.dx,
              ))
          .tween(
            'dy',
            Tween<double>(
              begin: pivotPoint,
              end: pivotPoint,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'color1',
            ColorTween(
              begin: const Color(0xFFD8FF18),
              end: const Color(0xFFFFE6C4),
            ),
          )
          .tween(
            'color2',
            ColorTween(
              begin: const Color(0xFFE0F66E),
              end: const Color(0xFFFFBC78),
            ),
          )
          .tween(
            'color3',
            ColorTween(
              begin: const Color(0xFFEEEE41),
              end: const Color(0xFF42FFD9),
            ),
          )
          .tween(
            'color4',
            ColorTween(
              begin: const Color(0xFFFDE30E),
              end: const Color(0xFF4497C5),
            ),
          )
          .tween(
            'stop1',
            Tween<double>(
              begin: 0.0,
              end: 0.0,
            ),
          )
          .tween(
            'stop2',
            Tween<double>(
              begin: 0.52,
              end: 0.33,
            ),
          )
          .tween(
            'stop3',
            Tween<double>(
              begin: 0.69,
              end: 0.4,
            ),
          )
          .tween(
            'stop4',
            Tween<double>(
              begin: 1.0,
              end: 1.0,
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
