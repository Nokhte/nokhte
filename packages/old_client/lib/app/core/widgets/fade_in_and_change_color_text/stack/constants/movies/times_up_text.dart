import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/fade_in_and_change_color_text/stack/constants/data/colors.dart';
import 'package:simple_animations/simple_animations.dart';

class TimesUpText extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: Seconds.get(1),
    )
        .tween(
          'text opacity',
          Tween<double>(
            begin: 0,
            end: 1,
          ),
        )
        .tween(
          'text color',
          ColorTween(
            begin: ColorsSwatch.white,
            end: ColorsSwatch.white,
          ),
        )
    ..scene(
      begin: Seconds.get(1),
      end: Seconds.get(20),
    )
        .tween(
          'text opacity',
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
        .tween(
          'text color',
          ColorTween(
            begin: ColorsSwatch.white,
            end: ColorsSwatch.white,
          ),
        )
    ..scene(
      begin: Seconds.get(25),
      end: Seconds.get(25, milli: 900),
    )
        .tween(
          'text opacity',
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
        .tween(
          'text color',
          ColorTween(
            begin: ColorsSwatch.white,
            end: ColorsSwatch.lightPurple,
          ),
        )
    ..scene(
      begin: Seconds.get(25, milli: 500),
      end: Seconds.get(44),
    )
        .tween(
          'text color',
          ColorTween(
            begin: ColorsSwatch.lightPurple,
            end: ColorsSwatch.darkerPurple,
          ),
        )
        .tween(
          'text opacity',
          Tween<double>(
            begin: 1,
            end: 1,
          ),
        )
    ..scene(
      begin: Seconds.get(44),
      end: Seconds.get(45),
    )
        .tween(
          'text color',
          ColorTween(
            begin: ColorsSwatch.darkerPurple,
            end: ColorsSwatch.darkerPurple,
          ),
        )
        .tween(
          'text opacity',
          Tween<double>(
            begin: 1,
            end: 0,
          ),
        );
  @override
  List<Object> get props => [];
}
