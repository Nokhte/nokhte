import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class MoveInvertedBeachWavesToCross {
  static MovieTween getMovie(Offset screenCenter) => MovieTween()
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
            begin: (-screenCenter.dy) * 1.1,
            end: CircleOffsets.top.dy,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'color1',
          ColorTween(
            begin: const Color(0xFFFFE6C4),
            end: const Color(0xFFFFE6C4),
          ),
        )
        .tween(
          'color2',
          ColorTween(
            begin: const Color(0xFFFFBC78),
            end: const Color(0xFFFFBC78),
          ),
        )
        .tween(
          'color3',
          ColorTween(
            begin: const Color(0xFF42FFD9),
            end: const Color(0xFF42FFD9),
          ),
        )
        .tween(
          'color4',
          ColorTween(
            begin: const Color(0xFF4497C5),
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
            begin: 0.33,
            end: 0.33,
          ),
        )
        .tween(
          'stop3',
          Tween<double>(
            begin: 0.4,
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
            begin: 100,
            end: 100,
          ),
        )
        .tween(
          'radius',
          Tween<double>(
            begin: 25,
            end: 4.5,
          ),
        );
}
