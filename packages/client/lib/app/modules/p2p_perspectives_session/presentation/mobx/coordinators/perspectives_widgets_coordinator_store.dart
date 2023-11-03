// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
// import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'perspectives_widgets_coordinator_store.g.dart';

class PerspectivesWidgetsCoordinatorStore = _PerspectivesWidgetsCoordinatorStoreBase
    with _$PerspectivesWidgetsCoordinatorStore;

abstract class _PerspectivesWidgetsCoordinatorStoreBase extends Equatable
    with Store {
  final BeachHorizonWaterTrackerStore beachHorizonWater;
  final BeachSkyStore beachSky;
  final PerspectivesMapStore perspectivesMap;
  final CollaborativeTextEditorTrackerStore collaborativeTextEditor;

  _PerspectivesWidgetsCoordinatorStoreBase({
    required this.beachHorizonWater,
    required this.beachSky,
    required this.perspectivesMap,
    required this.collaborativeTextEditor,
  });

  setText(String newContent) {
    collaborativeTextEditor.setText(newContent);
  }

  attuneTheWidgets(
    DateTime now, {
    defaultChosenIndex = 0,
  }) {
    beachHorizonWater.selectTimeBasedMovie(
      now,
      WaterColorsAndStops.oceanDiveWater,
    );
    beachSky.selectTimeBasedMovie(now);
    Future.delayed(Seconds.get(9, milli: 800), () {
      perspectivesMap.toggleWidgetVisibility();
      perspectivesMap.setMovie(PerspectivesMapColorAndVertOffsetChange.getMovie(
        startingCircleColors:
            PerspectivesMapAnimationData.getWhiteArr(defaultChosenIndex),
        endingCircleColors:
            PerspectivesMapAnimationData.getWhiteArr(defaultChosenIndex),
        startingVertOffsets: List.filled(5, 0),
        endingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(defaultChosenIndex),
      ));
      collaborativeTextEditor.flipWidgetVisibility();
      perspectivesMap.controller = Control.playFromStart;
    });
  }

  changeToInProgressColor(int chosenIndex) => perspectivesMap.setMovie(
        PerspectivesMapColorAndVertOffsetChange.getMovie(
          startingCircleColors:
              PerspectivesMapAnimationData.getWhiteArr(chosenIndex),
          endingCircleColors:
              PerspectivesMapAnimationData.getCommitInProgressArr(chosenIndex),
          startingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
          endingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
        ),
      );

  inProgressToDoneTransition(int chosenIndex) => perspectivesMap.setMovie(
        PerspectivesMapColorAndVertOffsetChange.getMovie(
          startingCircleColors:
              PerspectivesMapAnimationData.getCommitInProgressArr(chosenIndex),
          endingCircleColors:
              PerspectivesMapAnimationData.getCommittedArr(chosenIndex),
          startingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
          endingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
        ),
      );

  inProgressColorReversion(int chosenIndex) => perspectivesMap.setMovie(
        PerspectivesMapColorAndVertOffsetChange.getMovie(
          startingCircleColors:
              PerspectivesMapAnimationData.getCommitInProgressArr(chosenIndex),
          endingCircleColors:
              PerspectivesMapAnimationData.getWhiteArr(chosenIndex),
          startingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
          endingVertOffsets:
              PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
        ),
      );

  moveUpOrDownToNextPerspective(
    int chosenIndex, {
    required bool shouldMoveUp,
  }) {
    final prevIndex = shouldMoveUp ? chosenIndex - 1 : chosenIndex + 1;
    // setText('');
    // ^^ this
    collaborativeTextEditor.flipWidgetVisibility();
    perspectivesMap.setMovie(
      PerspectivesMapColorAndVertOffsetChange.getMovie(
        startingCircleColors:
            PerspectivesMapAnimationData.getCommittedArr(prevIndex),
        endingCircleColors:
            PerspectivesMapAnimationData.getCompletedAndMarkupColors(
                chosenIndex),
        startingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(prevIndex),
        endingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
      ),
    );
  }

  transitionBackToShore() {
    //
  }

  @override
  List<Object> get props => [];
}
