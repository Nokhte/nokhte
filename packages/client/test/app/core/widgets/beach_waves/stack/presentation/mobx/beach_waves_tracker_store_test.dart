import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

void main() {
  late BeachWavesTrackerStore homeModuleStateTrackerStore;
  late BeachWavesTrackerStore p2pCollaboratorPoolStateTrackerStore;

  setUp(() {
    homeModuleStateTrackerStore = BeachWavesTrackerStore();
    p2pCollaboratorPoolStateTrackerStore = BeachWavesTrackerStore();
  });

  test("sets default values correctly", () {
    expect(homeModuleStateTrackerStore.movieStatus, MovieStatus.idle);
    expect(homeModuleStateTrackerStore.lastWaterValue, -10.0);
    expect(homeModuleStateTrackerStore.movieMode, BeachWaveMovieModes.onShore);
    expect(homeModuleStateTrackerStore.control, Control.mirror);
  });

  test(
      "INTERACTION No. 1: Swipe Up on Home Screen & Swipe Down in Speak The Collaborator Phrase Screen",
      () {
    homeModuleStateTrackerStore.teeUpOceanDive();
    expect(homeModuleStateTrackerStore.movieMode,
        BeachWaveMovieModes.oceanDiveSetup);

    p2pCollaboratorPoolStateTrackerStore.teeOceanDiveMovieUp(
        startingWaterMovement: 0.0);
    expect(p2pCollaboratorPoolStateTrackerStore.movieMode,
        BeachWaveMovieModes.oceanDive);
    expect(p2pCollaboratorPoolStateTrackerStore.control, Control.playFromStart);
    expect(p2pCollaboratorPoolStateTrackerStore.control, Control.playFromStart);
    expect(p2pCollaboratorPoolStateTrackerStore.movieStatus,
        MovieStatus.inProgress);
    p2pCollaboratorPoolStateTrackerStore.initiateBackToShore();
    expect(p2pCollaboratorPoolStateTrackerStore.movieMode,
        BeachWaveMovieModes.backToShore);
    homeModuleStateTrackerStore = BeachWavesTrackerStore();
    expect(homeModuleStateTrackerStore.movieStatus, MovieStatus.idle);
    expect(homeModuleStateTrackerStore.lastWaterValue, -10.0);
    expect(homeModuleStateTrackerStore.movieMode, BeachWaveMovieModes.onShore);
    expect(homeModuleStateTrackerStore.control, Control.mirror);
  });
}
