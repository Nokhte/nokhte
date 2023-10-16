import 'package:flutter/material.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class AtMinOrMax {
  static MovieTween getMovie({required bool atMin}) => MovieTween()
    ..scene(
      begin: Seconds.get(0),
      end: const Duration(milliseconds: 500),
    )
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
            end: TextPlacementConstants.twoLeft + (atMin ? -9 : 9),
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
        )
    ..scene(
      begin: const Duration(milliseconds: 500),
      end: Seconds.get(1),
    )
        .tween(
          '0 left position',
          Tween<double>(
            begin: TextPlacementConstants.zeroLeft,
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
            begin: TextPlacementConstants.twoLeft + (atMin ? -9 : 9),
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
