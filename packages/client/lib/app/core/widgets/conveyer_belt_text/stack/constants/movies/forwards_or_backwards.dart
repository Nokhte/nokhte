import 'package:flutter/material.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';

class ForwardsOrBackwards {
  static MovieTween getMovie({required bool isForward}) => MovieTween()
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
            end: TextPlacementConstants.twoLeft,
          ),
        )
        .tween(
          '2 top position',
          Tween<double>(
            begin: TextPlacementConstants.elevatedHeight,
            end: TextPlacementConstants.regularHeight,
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
            end: isForward
                ? TextPlacementConstants.zeroLeft
                : TextPlacementConstants.oneLeft,
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
            end: isForward
                ? TextPlacementConstants.zeroLeft
                : TextPlacementConstants.twoLeft,
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
            end: isForward
                ? TextPlacementConstants.oneLeft
                : TextPlacementConstants.threeLeft,
          ),
        )
        .tween(
          '2 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: TextPlacementConstants.regularHeight,
          ),
        )
        .tween(
          '3 left position',
          Tween<double>(
            begin: TextPlacementConstants.threeLeft,
            end: isForward
                ? TextPlacementConstants.twoLeft
                : TextPlacementConstants.fourLeft,
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
            end: isForward
                ? TextPlacementConstants.threeLeft
                : TextPlacementConstants.fourLeft,
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
      begin: Seconds.get(1),
      end: Seconds.get(1, milli: 500),
    )
        .tween(
          '0 left position',
          Tween<double>(
            begin: isForward
                ? TextPlacementConstants.zeroLeft
                : TextPlacementConstants.oneLeft,
            end: isForward
                ? TextPlacementConstants.zeroLeft
                : TextPlacementConstants.oneLeft,
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
            begin: isForward
                ? TextPlacementConstants.zeroLeft
                : TextPlacementConstants.twoLeft,
            end: isForward
                ? TextPlacementConstants.zeroLeft
                : TextPlacementConstants.twoLeft,
          ),
        )
        .tween(
          '1 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: isForward
                ? TextPlacementConstants.regularHeight
                : TextPlacementConstants.elevatedHeight,
          ),
        )
        .tween(
          '2 left position',
          Tween<double>(
            begin: isForward
                ? TextPlacementConstants.oneLeft
                : TextPlacementConstants.threeLeft,
            end: isForward
                ? TextPlacementConstants.oneLeft
                : TextPlacementConstants.threeLeft,
          ),
        )
        .tween(
          '2 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: TextPlacementConstants.regularHeight,
          ),
        )
        .tween(
          '3 left position',
          Tween<double>(
            begin: isForward
                ? TextPlacementConstants.twoLeft
                : TextPlacementConstants.fourLeft,
            end: isForward
                ? TextPlacementConstants.twoLeft
                : TextPlacementConstants.fourLeft,
          ),
        )
        .tween(
          '3 top position',
          Tween<double>(
            begin: TextPlacementConstants.regularHeight,
            end: isForward
                ? TextPlacementConstants.elevatedHeight
                : TextPlacementConstants.regularHeight,
          ),
        )
        .tween(
          '4 left position',
          Tween<double>(
            begin: isForward
                ? TextPlacementConstants.threeLeft
                : TextPlacementConstants.fourLeft,
            end: isForward
                ? TextPlacementConstants.threeLeft
                : TextPlacementConstants.fourLeft,
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
