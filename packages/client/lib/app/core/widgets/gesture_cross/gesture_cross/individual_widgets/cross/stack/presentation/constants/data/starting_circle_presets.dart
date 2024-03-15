import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class StartingCirclePresets {
  static List<CircleInformation> get homeScreen => [
        CircleInformation(
          colorOrGradient: Left(Colors.white.withOpacity(.25)),
          offset: CircleOffsets.bottom,
        ),
        CircleInformation(
          colorOrGradient: const Right(ColorsAndStops(
            colors: [Colors.white],
            stops: [0],
          )),
          offset: CircleOffsets.center,
        ),
        CircleInformation(
          colorOrGradient: Left(Colors.white.withOpacity(.25)),
          offset: CircleOffsets.left,
        ),
        CircleInformation(
          colorOrGradient: Left(Colors.white.withOpacity(.25)),
          offset: CircleOffsets.right,
        ),
        CircleInformation(
          colorOrGradient: const Right(ColorsAndStops(
            colors: [Color(0xFF4CD7FC), Color(0xFF6AEAB9)],
            stops: [.1, .6],
          )),
          offset: CircleOffsets.top,
        ),
      ];
}
