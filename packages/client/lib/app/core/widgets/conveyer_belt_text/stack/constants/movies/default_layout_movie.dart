import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

class DefaultLayoutMovie {
  static MovieTween get movie => MovieTween()
    ..scene(begin: Seconds.get(0), end: Seconds.get(1))
        .tween(
          '0 left position',
          Tween<double>(
            begin: 20, // -500 works
            end: 20,
          ),
        )
        .tween(
          '0 right position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '0 bottom position', // doesn't seem to do anything
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '0 top position',
          Tween<double>(
            begin: 456,
            end: 456,
          ),
        )
        .tween(
          '1 left position',
          Tween<double>(
            begin: 150,
            end: 150,
          ),
        )
        .tween(
          '1 right position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '1 bottom position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '1 top position',
          Tween<double>(
            begin: 440,
            end: 440,
          ),
        )
        .tween(
          '2 left position',
          Tween<double>(
            begin: 285,
            end: 285,
          ),
        )
        .tween(
          '2 right position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '2 bottom position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '2 top position',
          Tween<double>(
            begin: 456,
            end: 456,
          ),
        )
        .tween(
          '3 left position',
          Tween<double>(
            begin: 400,
            end: 400,
          ),
        )
        .tween(
          '3 right position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '3 bottom position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '3 top position',
          Tween<double>(
            begin: 456,
            end: 456,
          ),
        )
        .tween(
          '4 left position',
          Tween<double>(
            begin: 450,
            end: 450,
          ),
        )
        .tween(
          '4 right position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '4 bottom position',
          Tween<double>(
            begin: 0,
            end: 0,
          ),
        )
        .tween(
          '4 top position',
          Tween<double>(
            begin: 456,
            end: 456,
          ),
        );
  // todo add these back in the widget & we'll prob need
  // top ones as well
}
