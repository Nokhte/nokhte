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
    defaultActiveIndex = 0,
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
            PerspectivesMapAnimationData.getWhiteArr(defaultActiveIndex),
        endingCircleColors:
            PerspectivesMapAnimationData.getWhiteArr(defaultActiveIndex),
        startingVertOffsets: List.filled(5, 0),
        endingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(defaultActiveIndex),
      ));
      collaborativeTextEditor.flipWidgetVisibility();
      perspectivesMap.controller = Control.playFromStart;
    });
    //
  }

  changeToInProgressColor(int activeIndex) {
    perspectivesMap.setMovie(
      PerspectivesMapColorAndVertOffsetChange.getMovie(
        startingCircleColors:
            PerspectivesMapAnimationData.getWhiteArr(activeIndex),
        endingCircleColors:
            PerspectivesMapAnimationData.getCommitInProgressArr(activeIndex),
        startingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(activeIndex),
        endingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(activeIndex),
      ),
    );
  }

  inProgressToDoneTransition(int activeIndex) {
    perspectivesMap.setMovie(
      PerspectivesMapColorAndVertOffsetChange.getMovie(
        startingCircleColors:
            PerspectivesMapAnimationData.getCommitInProgressArr(activeIndex),
        endingCircleColors:
            PerspectivesMapAnimationData.getCommittedArr(activeIndex),
        startingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(activeIndex),
        endingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(activeIndex),
      ),
    );
    //
  }

  inProgressColorReversion(int activeIndex) {
    perspectivesMap.setMovie(
      PerspectivesMapColorAndVertOffsetChange.getMovie(
        startingCircleColors:
            PerspectivesMapAnimationData.getCommitInProgressArr(activeIndex),
        endingCircleColors:
            PerspectivesMapAnimationData.getWhiteArr(activeIndex),
        startingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(activeIndex),
        endingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(activeIndex),
      ),
    );
  }

  @override
  List<Object> get props => [];
}
