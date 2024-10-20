import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class ChooseCancelMovie {
  static MovieTween getMovie({
    bool reverse = false,
  }) {
    final endMintGradColor1 = reverse ? Colors.white : const Color(0xFFC0F1A9);
    final endMintGradColor2 = reverse ? Colors.white : const Color(0xFF53FF5A);

    final endCherryGradColor1 =
        reverse ? Colors.white : const Color(0xFFF1A9A9);
    final endCherryGradColor2 =
        reverse ? Colors.white : const Color(0xFFFF5353);

    return MovieTween()
      ..scene(
        begin: Seconds.get(0),
        end: Seconds.get(1),
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
              begin: reverse ? 280 : 130.0,
              end: reverse ? 130.0 : 280,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy2',
            Tween<double>(
              begin: -20,
              end: -20,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy3',
            Tween<double>(
              begin: 280,
              end: 280,
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
              begin: endMintGradColor1,
              end: endMintGradColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g2c2',
            ColorTween(
              begin: endMintGradColor2,
              end: endMintGradColor2,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g3c1',
            ColorTween(
              begin: endCherryGradColor1,
              end: endCherryGradColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g3c2',
            ColorTween(
              begin: endCherryGradColor2,
              end: endCherryGradColor2,
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
              begin: 1,
              end: 0,
            ),
          )
      ..scene(
        begin: Seconds.get(1),
        end: Seconds.get(2),
      )
          .tween(
            'rad1',
            Tween<double>(
              begin: 29,
              end: 0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'rad2',
            Tween<double>(
              begin: 29,
              end: 0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'rad3',
            Tween<double>(
              begin: 29,
              end: 0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'rad4',
            Tween<double>(
              begin: 0,
              end: 0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          );
  }
}
