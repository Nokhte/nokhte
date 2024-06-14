import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class StrictSeatingMovie {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'top.dx',
          Tween<double>(
            begin: 0,
            end: 24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'top.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dx',
          Tween<double>(
            begin: 0,
            end: 24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dx',
          Tween<double>(
            begin: 0,
            end: -24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dx',
          Tween<double>(
            begin: 0,
            end: -24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(2),
    )
        .tween(
          'top.dx',
          Tween<double>(
            begin: 24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'top.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dx',
          Tween<double>(
            begin: 24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dx',
          Tween<double>(
            begin: -24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dx',
          Tween<double>(
            begin: -24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(2),
      end: Seconds.get(3),
    )
        .tween(
          'top.dx',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'top.dy',
          Tween<double>(
            begin: 0,
            end: -24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dx',
          Tween<double>(
            begin: 0,
            end: 21,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dy',
          Tween<double>(
            begin: 0,
            end: 9,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dx',
          Tween<double>(
            begin: 0,
            end: 21,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dy',
          Tween<double>(
            begin: 0,
            end: 9,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dx',
          Tween<double>(
            begin: 0,
            end: -21,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dy',
          Tween<double>(
            begin: 0,
            end: 9,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(3),
      end: Seconds.get(4),
    )
        .tween(
          'top.dx',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'top.dy',
          Tween<double>(
            begin: -24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dx',
          Tween<double>(
            begin: 21,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dy',
          Tween<double>(
            begin: 9,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dx',
          Tween<double>(
            begin: 21,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dy',
          Tween<double>(
            begin: 9,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dx',
          Tween<double>(
            begin: -21,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dy',
          Tween<double>(
            begin: 9,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(4),
      end: Seconds.get(5),
    )
        .tween(
          'top.dx',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'top.dy',
          Tween<double>(
            begin: 0,
            end: -24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dx',
          Tween<double>(
            begin: 0,
            end: 24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dx',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dy',
          Tween<double>(
            begin: 0,
            end: 24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dx',
          Tween<double>(
            begin: 0,
            end: -24,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(3),
      end: Seconds.get(4),
    )
        .tween(
          'top.dx',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'top.dy',
          Tween<double>(
            begin: -24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dx',
          Tween<double>(
            begin: 24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dx',
          Tween<double>(
            begin: 24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dx',
          Tween<double>(
            begin: -24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
    ..scene(
      begin: Seconds.get(5),
      end: Seconds.get(6),
    )
        .tween(
          'top.dx',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'top.dy',
          Tween<double>(
            begin: -24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dx',
          Tween<double>(
            begin: 24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'right.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dx',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'bottom.dy',
          Tween<double>(
            begin: 24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dx',
          Tween<double>(
            begin: -24,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'left.dy',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        );
}
