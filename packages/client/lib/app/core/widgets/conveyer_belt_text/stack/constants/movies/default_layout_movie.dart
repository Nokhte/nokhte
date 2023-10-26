import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class DefaultLayoutMovie {
  static MovieTween get movie => MovieTween()
    ..scene(begin: Seconds.get(0), end: Seconds.get(10))
        .tween(
          '0 left position',
          Tween<double>(
            begin: TextPlacementConstants.zeroLeft, // -500 works
            end: TextPlacementConstants.zeroLeft,
          ),
        )
        .tween(
          '0 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: TextPlacementConstants.regularHeight,
          ),
        )
        .tween(
          '1 left position',
          Tween<double>(
            begin: TextPlacementConstants.oneLeft,
            end: TextPlacementConstants.oneLeft,
          ),
        )
        .tween(
          '1 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: TextPlacementConstants.regularHeight,
          ),
        )
        .tween(
          '2 left position',
          Tween<double>(
            begin: TextPlacementConstants.twoLeft,
            end: TextPlacementConstants.twoLeft,
          ),
        )
        .tween(
          '2 top position',
          Tween<double>(
            begin: TextPlacementConstants.elevatedHeight,
            end: TextPlacementConstants.elevatedHeight,
          ),
        )
        .tween(
          '3 left position',
          Tween<double>(
            begin: TextPlacementConstants.threeLeft,
            end: TextPlacementConstants.threeLeft,
          ),
        )
        .tween(
          '3 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: TextPlacementConstants.regularHeight,
          ),
        )
        .tween(
          '4 left position',
          Tween<double>(
            begin: TextPlacementConstants.fourLeft,
            end: TextPlacementConstants.fourLeft,
          ),
        )
        .tween(
          '4 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: TextPlacementConstants.regularHeight,
          ),
        );
}
