/// breathing_pentagons_state_tracker_store.dart
///
///Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 30th 2023
///
/// Author: Sonny Vesali
///
/// A MobX-powered state management class that controls the animation and state
/// of the breathing pentagons button. This class is responsible for handling
/// the different animation modes, such as aggressive expansion, wind down, and
/// infinite rotation, and also manages the control type to start, stop, or loop
/// the animations.
///
/// Properties:
/// - movie: An observable MovieTween that represents the current animation
///   movie. It holds the animation information for the button.
///
/// - mode: An observable MovieModes that represents the current animation mode.
/// It can have values such as MovieModes.idle, MovieModes.aggressiveExpansion,
/// MovieModes.windDown, and MovieModes.infiniteRotation, depending on the state
/// of the animation.
///
/// - controlType: An observable Control that represents the current control
/// type for the animation. It can be Control.stop, Control.play, or
/// Control.loop.
///
/// Methods:
/// - teeReverseMovieUp: An action that initiates the wind down animation. It
///   receives various parameters representing the last animated values of the
///   aggressive expansion animation, and it sets the movie to the wind down
///   animation using the WindDown.getWindDownMovie method.
///
/// - gestureFunctionRouter: An action that handles the gesture event on the
///   button and switches between different animation modes based on the current
///   mode. If the mode is MovieModes.aggressiveExpansion or
///   MovieModes.infiniteRotation, it switches to MovieModes.windDown.
///   If the mode is MovieModes.idle, it initiates aggressive expansion
///   animation using the initiateAggressiveExpansion method.
///
/// - onCompletedAnimationCallback: An action that is called when an animation
///   is completed. It checks the current mode and initiates either the
///   wind down animation or the infinite rotation animation,
///   depending on the current mode.
///
/// - initiateReverseMovie: An action that initiates the reverse movie
///   (wind down) animation by setting the controlType to Control.play and the
///   mode to MovieModes.idle.
///
/// - initiateAggressiveExpansion: An action that initiates the aggressive
///   expansion animation. It sets the movie to the aggressive expansion movie if
///   it's not already set to it. It also sets the controlType to
///   Control.playFromStart and the mode to MovieModes.aggressiveExpansion.
///
/// - initiateInfiniteRotation: An action that initiates the infinite rotation
///   animation. It sets the mode to MovieModes.infiniteRotation and the
///   controlType to Control.loop. It also sets the movie to the infinite spinner
///   movie.
///
/// The class uses the props method from the Equatable mixin to track the
/// relevant properties for equality checks during state updates. This ensures
/// that updates to the state are handled efficiently and only when necessary.
///
/// Note: This class is generated using MobX code generation and includes
/// private types in the public API (ignores the ignore_for_file comment). The
/// use of MobX code generation improves the performance of state management
/// and reduces boilerplate code.

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/breathing_pentagons_stack/constants/constants.dart';
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
