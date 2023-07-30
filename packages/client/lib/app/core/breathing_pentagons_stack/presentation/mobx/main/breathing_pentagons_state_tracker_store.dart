// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/movies/breathing_pentagons/wind_down.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/movies/movies.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'breathing_pentagons_state_tracker_store.g.dart';

class BreathingPentagonsStateTrackerStore = _BreathingPentagonsStateTrackerStoreBase
    with _$BreathingPentagonsStateTrackerStore;

abstract class _BreathingPentagonsStateTrackerStoreBase extends Equatable
    with Store {
  @observable
  MovieTween movie = AggressiveExpansion.movie;

  @observable
  MovieModes mode = MovieModes.idle;

  @observable
  Control controlType = Control.stop;

  @action
  teeReverseMovieUp({
    required double angle,
    required double scale,
    required Color firstPentagonFirstGradient,
    required Color firstPentagonSecondGradient,
    required Color secondPentagonFirstGradient,
    required Color secondPentagonSecondGradient,
    required Color thirdPentagonFirstGradient,
    required Color thirdPentagonSecondGradient,
  }) {
    controlType = Control.stop;
    movie = WindDown.getWindDownMovie(
      startingAngle: angle,
      startingScale: scale,
      startingFirstPentagonFirstGradient: firstPentagonFirstGradient,
      startingFirstPentagonSecondGradient: firstPentagonSecondGradient,
      startingSecondPentagonFirstGradient: secondPentagonFirstGradient,
      startingSecondPentagonSecondGradient: secondPentagonSecondGradient,
      startingThirdPentagonFirstGradient: thirdPentagonFirstGradient,
      startingThirdPentagonSecondGradient: thirdPentagonSecondGradient,
    );
    // mode = MovieModes.windDown;
  }

  @action
  gestureFunctionRouter() {
    if (mode == MovieModes.aggressiveExpansion ||
        mode == MovieModes.infiniteRotation) {
      mode = MovieModes.windDown;
    } else if (mode == MovieModes.idle) {
      initiateAggressiveExpansion();
    }
  }

  @action
  onCompletedAnimationCallback() {
    if (mode == MovieModes.windDown) {
      initiateReverseMovie();
    } else if (mode == MovieModes.aggressiveExpansion) {
      initiateInfiniteRotation();
    }
  }

  @action
  initiateReverseMovie() {
    controlType = Control.play;
    mode = MovieModes.idle;
  }

  @action
  initiateAggressiveExpansion() {
    movie != AggressiveExpansion.movie
        ? movie = AggressiveExpansion.movie
        : null;
    // controlType = Control.play;
    controlType = Control.playFromStart;

    mode = MovieModes.aggressiveExpansion;
  }

  @action
  void initiateInfiniteRotation() {
    mode = MovieModes.infiniteRotation;
    controlType = Control.loop;
    movie = InfiniteSpinner.movie;
  }

  @override
  List<Object> get props => [
        mode,
        movie,
        controlType,
      ];
}
