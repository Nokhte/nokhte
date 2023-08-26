import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:primala/app/core/widgets/fade_in_and_change_color_text/stack/constants/data/colors.dart';
import 'package:simple_animations/simple_animations.dart';

class TimesUpText extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 1),
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
      begin: const Duration(seconds: 1),
      end: const Duration(seconds: 20),
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
      begin: const Duration(seconds: 25),
      end: const Duration(seconds: 25, milliseconds: 900),
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
      begin: const Duration(seconds: 25, milliseconds: 500),
      end: const Duration(seconds: 44),
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
      begin: const Duration(seconds: 44),
      end: const Duration(seconds: 45),
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
