// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/movies/movies.dart';
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
  @observable
  MovieTween movie = AggressiveExpansion.movie;

  @observable
  Control controlType = Control.stop;

  @observable
  bool isExpansionDone = false;

  @observable
  double startingPoint = 0.0;

  @action
  void expansionIsDone() {
    isExpansionDone = true;
    startingPoint = 0.5;
    controlType = Control.loop;
    movie = ColorChanges.movie;
  }

  @override
  List<Object> get props => [
// some items
      ];
}
