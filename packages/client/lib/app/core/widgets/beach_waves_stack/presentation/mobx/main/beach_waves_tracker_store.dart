// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/constants/movies/ocean_dive.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/constants/movies/on_shore.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/constants/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'beach_waves_tracker_store.g.dart';

class BeachWavesTrackerStore = _BeachWavesTrackerStoreBase
    with _$BeachWavesTrackerStore;

abstract class _BeachWavesTrackerStoreBase extends Equatable with Store {
  _BeachWavesTrackerStoreBase({
    required MovieModes defaultMovieMode,
  }) {
    //
    if (defaultMovieMode == MovieModes.oceanDiveSetup) {
      movie = OceanDive.getOceanDiveMovie(startingWaterMovement: passingParam);
      initiateOceanDive();
      control = Control.stop;
    }
  }

  @observable
  MovieTween movie = OnShore.movie;

  @observable
  bool isReadyToTransition = false;

  @observable
  double passingParam = 0.0;

  @observable
  MovieModes movieMode = MovieModes.onShore;

  @observable
  Control control = Control.mirror;

  @action
  gestureFunctionRouter() {
    if (movieMode == MovieModes.onShore) {
      movieMode = MovieModes.oceanDiveSetup;
    }
  }

  @action
  teeOceanDiveMovieUp({
    required double startingWaterMovement,
  }) {
    movie = OceanDive.getOceanDiveMovie(
        startingWaterMovement: startingWaterMovement);
    control = Control.stop;
    initiateOceanDive();
  }

  @action
  makeNavigationChange({
    required double startingWaterMovement,
  }) {
    isReadyToTransition = true;
    passingParam = startingWaterMovement;
    // movie = OceanDive.getOceanDiveMovie(
    //     startingWaterMovement: startingWaterMovement);
    // control = Control.stop;
    // initiateOceanDive();
  }

  @action
  initiateOceanDive() {
    movieMode = MovieModes.oceanDive;
    control = Control.playFromStart;
  }

  @action
  navigateProperly() {}

  @override
  List<Object> get props => [
// some items
      ];
}
