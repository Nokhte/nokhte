import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PillToCircle extends Equatable {
  static MovieTween get movie => MovieTween()
    ..scene(
      begin: const Duration(
        seconds: 0,
      ),
      end: const Duration(
        milliseconds: 400,
      ),
    )
        .tween(
          'first gradient color',
          ColorTween(
            begin: const Color(0xFF0A98FF),
            end: const Color(0xFF0A98FF),
            // end: const Color(0xFFFFFFFF),
          ),
        )
        .tween(
          'second gradient color',
          ColorTween(
            begin: const Color(0x00FFFFFF),
            end: const Color(0x00FFFFFF),
            // end: const Color(0xFFFFFFFF),
          ),
        )
        .tween(
          'center circle constant',
          Tween<double>(
            begin: 0.0,
            end: 29.0,
          ),
        )
    ..scene(
      begin: const Duration(
        milliseconds: 400,
      ),
      end: const Duration(
        milliseconds: 550,
      ),
    )
        .tween(
          'first gradient color',
          ColorTween(
            begin: const Color(0xFF0A98FF),
            end: const Color(0xFF0A98FF),
            // end: const Color(0xFFFFFFFF),
          ),
        )
        .tween(
          'second gradient color',
          ColorTween(
            begin: const Color(0x00FFFFFF),
            end: const Color(0x00FFFFFF),
            // end: const Color(0xFFFFFFFF),
          ),
        )
        .tween(
          'center circle constant',
          Tween<double>(
            begin: 29.0,
            end: 27.0,
          ),
        );

  @override
  List<Object> get props => [movie];
}
