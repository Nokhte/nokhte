import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SingleNokhteToCrossroadMovie {
  static MovieTween getMovie({
    bool reverse = false,
  }) {
    // final double beginningUpperDy = reverse ? -20.0 : 130.00;
    // final double endUpperDy = reverse ? 130.0 : -20.0;
    // final double centerDy = 130.0;
    // final double beginningLowerDy = reverse ? 280.0 : 130.00;
    // final double endLowerDy = reverse ? 130.00 : 0.0;

    final beginningMintGradColor1 =
        reverse ? const Color(0xFFC0F1A9) : Colors.white;
    final beginningMintGradColor2 =
        reverse ? const Color(0xFF53FF5A) : Colors.white;
    final endMintGradColor1 = reverse ? Colors.white : const Color(0xFFC0F1A9);
    final endMintGradColor2 = reverse ? Colors.white : const Color(0xFF53FF5A);

    final beginningCherryGradColor1 =
        reverse ? const Color(0xFFF1A9A9) : Colors.white;
    final beginningCherryGradColor2 =
        reverse ? const Color(0xFFFF5353) : Colors.white;
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
              begin: 130.0,
              end: 130.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy2',
            Tween<double>(
              begin: 130.0,
              end: -20.0,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'dy3',
            Tween<double>(
              begin: 130.0,
              end: 280.0,
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
              begin: beginningMintGradColor1,
              end: endMintGradColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g2c2',
            ColorTween(
              begin: beginningMintGradColor2,
              end: endMintGradColor2,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g3c1',
            ColorTween(
              begin: beginningCherryGradColor1,
              end: endCherryGradColor1,
            ),
            curve: Curves.easeInOutCubicEmphasized,
          )
          .tween(
            'g3c2',
            ColorTween(
              begin: beginningCherryGradColor2,
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
      ..scene(
        begin: Seconds.get(1),
        end: Seconds.get(2),
      ).tween(
        'textOpacity',
        Tween<double>(
          begin: 0,
          end: 1,
        ),
      );
  }
}
