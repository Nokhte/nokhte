import 'dart:math';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class SetupAvailabilitySectorsMovies {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(3),
    ).tween(
      "sectorLength",
      Tween<double>(
        begin: pi,
        end: 3.4,
      ),
    );
}
