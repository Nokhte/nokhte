// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
// import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'base_perspectives_widgets_store.g.dart';

class BasePerspectivesWidgetsStore = _PerspectivesWidgetsStoreBase
    with _$BasePerspectivesWidgetsStore;

abstract class _PerspectivesWidgetsStoreBase extends Equatable with Store {
  final BeachHorizonWaterTrackerStore beachHorizonWater;
  final BeachSkyStore beachSky;
  final PerspectivesMapStore perspectivesMap;
  final BeachWavesTrackerStore beachWaves;
  final CollaborativeTextEditorTrackerStore collaborativeTextEditor;

  @observable
  bool isFirstTimeGoingThroughIt = true;

  toggleIsFirstTimeGoingThroughIt() =>
      isFirstTimeGoingThroughIt = !isFirstTimeGoingThroughIt;

  _PerspectivesWidgetsStoreBase({
    required this.beachHorizonWater,
    required this.beachSky,
    required this.perspectivesMap,
    required this.collaborativeTextEditor,
    required this.beachWaves,
  }) {
    reaction((p0) => beachHorizonWater.backToShoreCompleted, (p0) {
      if (p0) {
        toggleBeachWavesVisibility();
        beachWaves.toggleWidgetVisibilty();
        beachWaves.initShallowsToShore();
        beachWaves.control = Control.play;
      }
    });

    reaction((p0) => beachWaves.movieStatus, (p0) {
      if (isFirstTimeGoingThroughIt) {
        toggleIsFirstTimeGoingThroughIt();
      } else if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.shallowsToShore) {
        Modular.to.navigate('/home/');
      }
    });
  }

  @observable
  bool beachWavesVisibility = false;

  @action
  toggleBeachWavesVisibility() => beachWavesVisibility = !beachWavesVisibility;

  setText(String newContent) {
    collaborativeTextEditor.setText(newContent);
  }

  attuneTheWidgets(
    DateTime now, {
    defaultChosenIndex = 0,
  }) {
    beachWaves.toggleWidgetVisibilty();
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
      collaborativeTextEditor.toggleWidgetVisibility();
      perspectivesMap.controller = Control.playFromStart;
    });
  }

  moveUpOrDownToNextPerspective(
    int chosenIndex, {
    required bool shouldMoveUp,
    bool shouldBeJustWhite = false,
  }) {
    final prevIndex = shouldMoveUp ? chosenIndex - 1 : chosenIndex + 1;
    collaborativeTextEditor.toggleWidgetVisibility();
    perspectivesMap.setMovie(
      PerspectivesMapColorAndVertOffsetChange.getMovie(
        startingCircleColors:
            PerspectivesMapAnimationData.getCommittedArr(prevIndex),
        endingCircleColors: shouldBeJustWhite
            ? PerspectivesMapAnimationData.getCompletedAndMarkupColors(
                chosenIndex)
            : PerspectivesMapAnimationData.getWhiteArr(chosenIndex),
        startingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(prevIndex),
        endingVertOffsets:
            PerspectivesMapAnimationData.getVertOffArr(chosenIndex),
      ),
    );
  }

  transitionBackToShore() {
    final theTimeToTransitionFrom = DateTime.now();
    perspectivesMap.toggleWidgetVisibility();
    collaborativeTextEditor.toggleWidgetVisibility();
    beachHorizonWater.fullSkyBackToShorePreReq(
        currentTime: theTimeToTransitionFrom);
    Future.delayed(Seconds.get(3), () {
      beachSky.selectTimeBasedMovie(theTimeToTransitionFrom);
      beachSky.control = Control.playReverseFromEnd;
      beachHorizonWater.initBackToShore(currentTime: theTimeToTransitionFrom);
    });
  }

  @override
  List<Object> get props => [];
}
