import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SingleNokhteToQuintupletMovie {
  static MovieTween getMovie({
    bool reverse = false,
  }) {
    final double beginningDx1 = reverse ? 44.0 : 0.0;
    final double endDx1 = reverse ? 0 : 44.0;
    final double beginningDx2 = reverse ? -44.0 : 0.0;
    final double endDx2 = reverse ? 0 : -44.0;
    final double beginningDy3 = reverse ? -85.0 : 0.0;
    final double endDy3 = reverse ? 0 : -85.0;
    final double beginningDy4 = reverse ? -85.0 : 0.0;
    final double endDy4 = reverse ? 0 : -85.0;

    final beginningColor1 = reverse ? const Color(0xFFC0F1A9) : Colors.white;
    final beginningColor2 = reverse ? const Color(0xFF53FF5A) : Colors.white;
    final endColor1 = reverse ? Colors.white : const Color(0xFFC0F1A9);
    final endColor2 = reverse ? Colors.white : const Color(0xFF53FF5A);

    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1),
      )
          .tween(
            'rad1',
            Tween<double>(
              begin: 29.0,
              end: 29.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'rad2',
            Tween<double>(
              begin: 29.0,
              end: 29.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'rad3',
            Tween<double>(
              begin: 29.0,
              end: 29.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'rad4',
            Tween<double>(
              begin: 29.0,
              end: 29.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dx1',
            Tween<double>(
              begin: beginningDx1,
              end: endDx1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dx2',
            Tween<double>(
              begin: beginningDx2,
              end: endDx2,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dx3',
            Tween<double>(
              begin: beginningDx1,
              end: endDx1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dx4',
            Tween<double>(
              begin: beginningDx2,
              end: endDx2,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy1',
            Tween<double>(
              begin: 0.0,
              end: reverse ? 130 : 0.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy2',
            Tween<double>(
              begin: 0.0,
              end: reverse ? 130 : 0.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy3',
            Tween<double>(
              begin: beginningDy3,
              // end: endDy3,
              end: reverse ? 130 : endDy3,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy4',
            Tween<double>(
              begin: beginningDy4,
              // end: endDy4,
              end: reverse ? 130 : endDy4,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g1c1',
            ColorTween(
              begin: beginningColor1,
              end: endColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g1c2',
            ColorTween(
              begin: beginningColor2,
              end: endColor2,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g2c1',
            ColorTween(
              begin: beginningColor1,
              end: endColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g2c2',
            ColorTween(
              begin: beginningColor2,
              end: endColor2,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g3c1',
            ColorTween(
              begin: beginningColor1,
              end: endColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g3c2',
            ColorTween(
              begin: beginningColor2,
              end: endColor2,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g4c1',
            ColorTween(
              begin: beginningColor1,
              end: endColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g4c2',
            ColorTween(
              begin: beginningColor2,
              end: endColor2,
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
}
