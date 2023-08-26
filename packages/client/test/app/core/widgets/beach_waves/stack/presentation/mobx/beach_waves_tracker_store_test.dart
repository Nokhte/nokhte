// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/types.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late BeachWavesTrackerStore homeModuleStateTrackerStore;
  late BeachWavesTrackerStore p2pCollaboratorPoolStateTrackerStore;

  setUp(() {
    homeModuleStateTrackerStore = BeachWavesTrackerStore();
    p2pCollaboratorPoolStateTrackerStore = BeachWavesTrackerStore();
  });

  /// 2 setups 1. is onShore, other is OceanDive
  test("sets default values correctly", () {
    expect(homeModuleStateTrackerStore.isReadyToTransition, false);
    expect(homeModuleStateTrackerStore.movieStatus, MovieStatus.inProgress);
    expect(homeModuleStateTrackerStore.passingParam, -10.0);
    expect(homeModuleStateTrackerStore.movieMode, MovieModes.onShore);
    expect(homeModuleStateTrackerStore.control, Control.mirror);
  });

  test(
      "INTERACTION No. 1: Swipe Up on Home Screen & Swipe Down in Speak The Collaborator Phrase Screen",
      () {
    // # User Swipes Up
    // homeModuleStateTrackerStore.teeUpOceanDive();
    expect(homeModuleStateTrackerStore.movieMode, MovieModes.oceanDiveSetup);

    /// # then navigation to p2p module happens and `teeOceanDiveMovieUp` is
    /// # called in the `SpeakTheCollaboratorPhraseScreen` constructor
    // p2pCollaboratorPoolStateTrackerStore.teeOceanDiveMovieUp(
    // startingWaterMovement: 0.0);
    expect(
        p2pCollaboratorPoolStateTrackerStore.movieMode, MovieModes.oceanDive);
    expect(p2pCollaboratorPoolStateTrackerStore.control, Control.playFromStart);
    // p2pCollaboratorPoolStateTrackerStore.collaboratorPhraseSwipeDownCallback();
    expect(p2pCollaboratorPoolStateTrackerStore.control, Control.playFromStart);
    expect(p2pCollaboratorPoolStateTrackerStore.movieStatus,
        MovieStatus.inProgress);
    p2pCollaboratorPoolStateTrackerStore.initiateBackToShore();
    expect(
        p2pCollaboratorPoolStateTrackerStore.movieMode, MovieModes.backToShore);
    // # then when the animation is completed navigation to home happens
    p2pCollaboratorPoolStateTrackerStore.onBeachWavesAnimationCompletion();
    // # and store is re-instantiated when navigated back to the home module
    homeModuleStateTrackerStore = BeachWavesTrackerStore();
    expect(homeModuleStateTrackerStore.isReadyToTransition, false);
    expect(homeModuleStateTrackerStore.movieStatus, MovieStatus.inProgress);
    expect(homeModuleStateTrackerStore.passingParam, -10.0);
    expect(homeModuleStateTrackerStore.movieMode, MovieModes.onShore);
    expect(homeModuleStateTrackerStore.control, Control.mirror);
  });
}
