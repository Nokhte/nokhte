// * Testing & Mocking Libs
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/constants/types/types.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/presentation/mobx/breathing_pentagons_state_tracker_store.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late BreathingPentagonsStateTrackerStore stateTrackerStore;

  setUp(() {
    stateTrackerStore = BreathingPentagonsStateTrackerStore();
  });

  test("sets default values correctly", () {
    expect(stateTrackerStore.movie, isA<MovieTween>());
    expect(stateTrackerStore.mode, MovieModes.idle);
    expect(stateTrackerStore.controlType, Control.stop);
  });

  test(
      "teeReverseMovieUp sets values properly, and sets up the wind down movie properties",
      () {
    stateTrackerStore.teeReverseMovieUp(
      angle: 0.0,
      scale: 0.0,
      firstPentagonFirstGradient: Colors.black,
      firstPentagonSecondGradient: Colors.black,
      secondPentagonFirstGradient: Colors.black,
      secondPentagonSecondGradient: Colors.black,
      thirdPentagonFirstGradient: Colors.black,
      thirdPentagonSecondGradient: Colors.black,
    );
    expect(stateTrackerStore.mode, MovieModes.idle);
    expect(stateTrackerStore.movie, isA<MovieTween>());
    expect(stateTrackerStore.controlType, Control.stop);
  });

  group("gestureFunctionRouter", () {
    test(
        "if aggresive expansion is playing and it's re-triggered windDown mode will be set",
        () {
      //arrange
      stateTrackerStore.mode = MovieModes.aggressiveExpansion;
      // act
      stateTrackerStore.gestureFunctionRouter();
      // assert
      expect(stateTrackerStore.mode, MovieModes.windDown);
    });
    test(
        "if infinite rotation is playing and it's re-triggered windDown mode will be set",
        () {
      //arrange
      stateTrackerStore.mode = MovieModes.infiniteRotation;
      // act
      stateTrackerStore.gestureFunctionRouter();
      // assert
      expect(stateTrackerStore.mode, MovieModes.windDown);
    });
    test("if windDown isn't complete, nothing will happen", () {
      //arrange
      stateTrackerStore.mode = MovieModes.windDown;
      // act
      stateTrackerStore.gestureFunctionRouter();
      // assert
      expect(stateTrackerStore.mode, MovieModes.windDown);
    });
    test(
        "if windDown is complete or animation is called for the first time, aggressive expansion will be set",
        () {
      //arrange
      stateTrackerStore.mode = MovieModes.idle;
      // act
      stateTrackerStore.gestureFunctionRouter();
      // assert
      expect(stateTrackerStore.mode, MovieModes.aggressiveExpansion);
    });
  });

  test("initiateReverseMovie sets values as expected", () {
    // arrange + act
    stateTrackerStore.initiateReverseMovie();
    expect(stateTrackerStore.controlType, Control.play);
    expect(stateTrackerStore.mode, MovieModes.idle);
  });
  test("initiateAggressiveExpansion sets values as expected", () {
    // arrange + act
    stateTrackerStore.initiateAggressiveExpansion();
    expect(stateTrackerStore.controlType, Control.playFromStart);
    expect(stateTrackerStore.mode, MovieModes.aggressiveExpansion);
  });
  test("initiateInfiniteRotation sets values as expected", () {
    // arrange + act
    stateTrackerStore.initiateInfiniteRotation();
    expect(stateTrackerStore.controlType, Control.loop);
    expect(stateTrackerStore.mode, MovieModes.infiniteRotation);
  });

  group("onCompletedAnimationCallback", () {
    test(
        "if the mode is windDown the initiateReverseMovie function will be called",
        () {
      // arrange
      stateTrackerStore.mode = MovieModes.windDown;
      // act
      stateTrackerStore.onCompletedAnimationCallback();
      // assert
      expect(stateTrackerStore.controlType, Control.play);
      expect(stateTrackerStore.mode, MovieModes.idle);
    });
    test(
        "if the mode is aggressivExpansion the initiateInfiniteRotation function will be called",
        () {
      // arrange
      stateTrackerStore.mode = MovieModes.aggressiveExpansion;
      // act
      stateTrackerStore.onCompletedAnimationCallback();
      // assert
      expect(stateTrackerStore.controlType, Control.loop);
      expect(stateTrackerStore.mode, MovieModes.infiniteRotation);
    });
  });

  test(
      "INTEGRATION: User initiates aggressive Expansion and Wind-down after some time",
      () {
    stateTrackerStore.gestureFunctionRouter(); // user taps
    stateTrackerStore.gestureFunctionRouter(); // user taps again
    expect(stateTrackerStore.mode, MovieModes.windDown);
    stateTrackerStore.onCompletedAnimationCallback(); // called
    expect(stateTrackerStore.mode, MovieModes.idle);
  });
  test(
      "INTEGRATION: User initiates aggressive Expansion and goes all the way to infinite Rotation & initiates Wind-down after some time",
      () {
    stateTrackerStore.gestureFunctionRouter(); // user taps
    stateTrackerStore.onCompletedAnimationCallback(); // animation completes
    expect(stateTrackerStore.mode, MovieModes.infiniteRotation);
    stateTrackerStore.gestureFunctionRouter(); // user taps again
    stateTrackerStore
        .onCompletedAnimationCallback(); // wind down animation initiated
    expect(stateTrackerStore.mode, MovieModes.idle);
  });
}
