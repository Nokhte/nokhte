// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/beach_waves_stack/constants/movies/movies.dart';
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
      animationStatus = AnimationStatus.inProgress;
    }
  }

  @observable
  MovieTween movie = OnShore.movie;

  @observable
  bool isReadyToTransition = false;

  @observable
  AnimationStatus animationStatus = AnimationStatus.inProgress;

  @observable
  double passingParam = -10.0;

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

  /// so it appears we need an on complete that takes into consideration that it
  /// should only do a thing if the movie mode is back to shore and it should reset store to defaults
  /// there should also probably be a function to trigger back to shore

  @action
  initiateBackToShore() {
    movie = BackToShore.movie;
    control = Control.playFromStart;
    animationStatus = AnimationStatus.inProgress;
    movieMode = MovieModes.backToShore;
    print("IS THIS WORKING $movieMode $control");
  }

  @action
  onShoreReturnComplete() {
    movie = OnShore.movie;
    control = Control.mirror;
    movieMode = MovieModes.onShore;
    animationStatus = AnimationStatus.idle;
    print("shore return complete run");

    // isReadyToTransition = true;
  }

  @action
  onOceanDiveComplete() {
    movieMode = MovieModes.oceanDive;
    animationStatus = AnimationStatus.idle;
    print("ocean dive complete run");
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
