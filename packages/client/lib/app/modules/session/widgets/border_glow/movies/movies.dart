import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class BorderGlowMovies {
  static MovieTween glowUp({
    Color startingColor = const Color(0x0004FF00),
    double startingWidth = 0.0,
  }) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        )
            .tween(
              'width',
              Tween<double>(
                begin: startingWidth,
                end: 1.0,
              ),
            )
            .tween(
              'color',
              ColorTween(
                begin: startingColor,
                end: const Color(0xFF04FF00),
              ),
            )
        ..scene(
          begin: Seconds.get(60),
          end: Seconds.get(62),
        ).tween(
          'color',
          ColorTween(
            begin: const Color(0xFF04FF00),
            end: const Color(0xFFFBFF00),
          ),
        )
        ..scene(
          begin: Seconds.get(90),
          end: Seconds.get(92),
        ).tween(
          'color',
          ColorTween(
            begin: const Color(0xFFFBFF00),
            end: const Color(0xFFCB3B44),
          ),
        )
        ..scene(
          begin: Seconds.get(90),
          end: Seconds.get(120),
        ).tween(
          'width',
          Tween<double>(
            begin: 1,
            end: 200.0,
          ),
        );

  static MovieTween glowDown({
    Color lastColor = Colors.transparent,
    double lastWidth = 0.0,
  }) =>
      MovieTween()
        ..scene(
          begin: Seconds.get(0),
          end: Seconds.get(2),
        )
            .tween(
              'color',
              ColorTween(
                begin: lastColor,
                end: Colors.transparent,
              ),
            )
            .tween(
              'width',
              Tween<double>(
                begin: lastWidth,
                end: 0,
              ),
            );

  static MovieTween synchronizeGlow({
    required DateTime startTime,
  }) {
    final now = DateTime.now();
    final difference = now.difference(startTime);
    final double elapsedMilliseconds = difference.inMilliseconds.toDouble();

    final adjustedStartTime = elapsedMilliseconds.clamp(0.0, 120000.0);

    final MovieTween movieTween = MovieTween();

    if (adjustedStartTime < 62000) {
      movieTween
          .scene(
            begin: const Duration(milliseconds: 0),
            end: const Duration(milliseconds: 2000),
          )
          .tween(
            'width',
            Tween<double>(
              begin: 0.0,
              end: 1.0,
            ),
          )
          .tween(
            'color',
            ColorTween(
              begin: const Color(0x0004FF00),
              end: const Color(0xFF04FF00),
            ),
          );

      movieTween
          .scene(
            begin: Duration(milliseconds: (60000 - adjustedStartTime).toInt()),
            end: Duration(milliseconds: (62000 - adjustedStartTime).toInt()),
          )
          .tween(
            'width',
            Tween<double>(
              begin: 0.0,
              end: 1.0,
            ),
          )
          .tween(
            'color',
            ColorTween(
              begin: const Color(0x00FBFF00),
              end: const Color(0xFFFBFF00),
            ),
          );

      movieTween
          .scene(
            begin: Duration(milliseconds: (90000 - adjustedStartTime).toInt()),
            end: Duration(milliseconds: (92000 - adjustedStartTime).toInt()),
          )
          .tween(
            'color',
            ColorTween(
              begin: const Color(0xFFFBFF00),
              end: const Color(0xFFCB3B44),
            ),
          );

      movieTween
          .scene(
            begin: Duration(milliseconds: (90000 - adjustedStartTime).toInt()),
            end: Duration(milliseconds: (120000 - adjustedStartTime).toInt()),
          )
          .tween(
            'width',
            Tween<double>(
              begin: 1.0,
              end: 200.0,
            ),
          );
    }

    if (adjustedStartTime >= 62000 && adjustedStartTime < 92000) {
      movieTween
          .scene(
            begin: const Duration(milliseconds: 0),
            end: const Duration(milliseconds: 2000),
          )
          .tween(
            'width',
            Tween<double>(
              begin: 0.0,
              end: 1.0,
            ),
          )
          .tween(
            'color',
            ColorTween(
              begin: const Color(0x00FBFF00),
              end: const Color(0xFFFBFF00),
            ),
          );

      movieTween
          .scene(
            begin: Duration(milliseconds: (90000 - adjustedStartTime).toInt()),
            end: Duration(milliseconds: (92000 - adjustedStartTime).toInt()),
          )
          .tween(
            'color',
            ColorTween(
              begin: const Color(0xFFFBFF00),
              end: const Color(0xFFCB3B44),
            ),
          );

      movieTween
          .scene(
            begin: Duration(milliseconds: (90000 - adjustedStartTime).toInt()),
            end: Duration(milliseconds: (120000 - adjustedStartTime).toInt()),
          )
          .tween(
            'width',
            Tween<double>(
              begin: 1.0,
              end: 200.0,
            ),
          );
    }

    if (adjustedStartTime >= 92000) {
      movieTween
          .scene(
            begin: const Duration(milliseconds: 0),
            end: const Duration(milliseconds: 2000),
          )
          .tween(
            'color',
            ColorTween(
              begin: const Color(0x00CB3B44),
              end: const Color(0xFFCB3B44),
            ),
          );

      movieTween
          .scene(
            begin: Duration(milliseconds: (92000 - adjustedStartTime).toInt()),
            end: Duration(milliseconds: (120000 - adjustedStartTime).toInt()),
          )
          .tween(
            'width',
            Tween<double>(
              begin: 1.0,
              end: 200.0,
            ),
          );
    }

    return movieTween;
  }
}
