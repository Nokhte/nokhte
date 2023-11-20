import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class GlowUp {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(10),
    ).tween(
      'color',
      ColorTween(
        begin: GlowColors.greenGlow,
        end: GlowColors.greenGlow,
      ),
    )
    ..scene(
      begin: Seconds.get(10),
      end: Seconds.get(11),
    ).tween(
      'color',
      ColorTween(
        begin: GlowColors.greenGlow,
        end: GlowColors.orangeGlow,
      ),
    )
    ..scene(
      begin: Seconds.get(11),
      end: Seconds.get(20),
    ).tween(
      'color',
      ColorTween(
        begin: GlowColors.orangeGlow,
        end: GlowColors.orangeGlow,
      ),
    )
    ..scene(
      begin: Seconds.get(20),
      end: Seconds.get(21),
    ).tween(
      'color',
      ColorTween(
        begin: GlowColors.orangeGlow,
        end: GlowColors.redGlow,
      ),
    )
    ..scene(
      begin: Seconds.get(20),
      end: Seconds.get(30),
    ).tween(
      'color',
      ColorTween(
        begin: GlowColors.redGlow,
        end: GlowColors.redGlow,
      ),
    )
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    ).tween(
      'opacity',
      Tween<double>(
        begin: 0.0,
        end: 1,
      ),
    )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(30),
    ).tween(
      'opacity',
      Tween<double>(
        begin: 1.0,
        end: 1.0,
      ),
    );
}
