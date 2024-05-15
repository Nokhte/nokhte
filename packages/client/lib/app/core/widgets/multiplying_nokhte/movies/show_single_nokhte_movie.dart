import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class ShowSingleNokhte {
  static MovieTween getMovie() => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'rad1',
          Tween<double>(
            begin: 0,
            end: 29,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'rad2',
          Tween<double>(
            begin: 0,
            end: 29,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'rad3',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'rad4',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dx1',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dx2',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dx3',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dx4',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dy1',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dy2',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dy3',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'dy4',
          Tween<double>(
            begin: 0.0,
            end: 0.0,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g1c1',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g1c2',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g2c1',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g2c2',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g3c1',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g3c2',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g4c1',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'g4c2',
          ColorTween(
            begin: Colors.white,
            end: Colors.white,
          ),
          curve: Curves.easeInOutCubicEmphasized,
        )
        .tween(
          'textOpacity',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        );
}
