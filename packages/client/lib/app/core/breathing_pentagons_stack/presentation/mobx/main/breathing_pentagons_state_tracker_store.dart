// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/pentagon_colors.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'breathing_pentagons_state_tracker_store.g.dart';

class BreathingPentagonsStateTrackerStore = _BreathingPentagonsStateTrackerStoreBase
    with _$BreathingPentagonsStateTrackerStore;

abstract class _BreathingPentagonsStateTrackerStoreBase extends Equatable
    with Store {
  @observable
  bool isCanvasSizeSet = false;

  @observable
  Size canvasSize = const Size(0, 0);

  @action
  setCanvasSize(Size newSize) {
    canvasSize = newSize;
    isCanvasSizeSet = true;
  }

  final int firstGradientColor = 0;
  final int secondGradientColor = 1;
  final int firstInterval = 0;
  final int secondInterval = 1;
  final int thirdInterval = 2;
  final int fourthInterval = 3;
  final int fifthInterval = 3;
  // production tween
  // @observable
  // MovieTween movie = MovieTween()
  //   // initial spin
  //   ..scene(begin: const Duration(seconds: 0), end: const Duration(seconds: 6))
  //       .tween(
  //     'angle',
  //     Tween<double>(
  //       begin: 0,
  //       end: 1.25,
  //     ),
  //   )
  //   ..scene(
  //     begin: const Duration(seconds: 0),
  //     end: const Duration(seconds: 6),
  //   ).tween(
  //     'scale',
  //     Tween<double>(
  //       begin: .6,
  //       end: .95,
  //     ),
  //   );
  @observable
  MovieTween movie = MovieTween()
    ..scene(
      begin: const Duration(seconds: 0),
      // 6 seconds 1.25
      end: const Duration(seconds: 36),
    )
        .tween(
          'angle',
          Tween<double>(
            begin: 0,
            end: 7.5,
          ),
        )
        .tween(
          'scale',
          Tween<double>(
            begin: .95,
            end: .95,
          ),
        )
    ..scene(
      begin: const Duration(seconds: 0),
      end: const Duration(seconds: 6),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 6),
      end: const Duration(seconds: 12),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.firstInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 12),
      end: const Duration(seconds: 18),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.secondInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 18),
      end: const Duration(seconds: 24),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.thirdInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
    ..scene(
      begin: const Duration(seconds: 24),
      end: const Duration(seconds: 30),
    )
        .tween(
          '1st Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '1st Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .firstPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .firstPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '2nd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .secondPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .secondPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.secondGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 1st Gradient Color',
          // turn to colors later
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.firstGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.firstGradientColor],
          ),
        )
        .tween(
          '3rd Pentagon > 2nd Gradient Color',
          ColorTween(
            begin: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fourthInterval]
                [PentagonColors.secondGradientColor],
            end: PentagonColors
                    .thirdPentagonGradients[PentagonColors.fifthInterval]
                [PentagonColors.secondGradientColor],
          ),
        );

  @observable
  Control controlType = Control.loop;

  @observable
  bool isExpansionDone = false;

  @observable
  double startingPoint = 0.0;

  @action
  void expansionIsDone() {
    isExpansionDone = true;
    startingPoint = 0.5;
    controlType = Control.loop;
    movie = MovieTween()
      ..scene(
              begin: const Duration(seconds: 0),
              end: const Duration(seconds: 6))
          .tween(
        'angle',
        Tween<double>(
          begin: 0,
          end: 1.25,
        ),
      )
      ..scene(
              begin: const Duration(seconds: 6),
              end: const Duration(seconds: 6))
          .tween(
        'angle',
        Tween<double>(
          begin: 1.25,
          end: 0,
        ),
      )
      ..scene(
              begin: const Duration(seconds: 0),
              end: const Duration(seconds: 6))
          .tween(
        'scale',
        Tween<double>(
          begin: .95,
          end: .95,
        ),
      );
  }

  @override
  List<Object> get props => [
// some items
      ];
}
