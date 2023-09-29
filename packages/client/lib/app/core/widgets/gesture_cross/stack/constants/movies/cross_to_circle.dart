import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class CrossToCircle extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(
        seconds: 0,
      ),
      end: const Duration(
        seconds: 1,
      ),
    )
        .tween(
          'first gradient color',
          ColorTween(
            begin: const Color(0xFF0A98FF),
            end: const Color(0xFFFFFFFF),
          ),
        )
        .tween(
          'second gradient color',
          ColorTween(
            begin: const Color(0x00FFFFFF),
            end: const Color(0xFFFFFFFF),
          ),
        );

  @override
  List<Object> get props => [movie];
}
