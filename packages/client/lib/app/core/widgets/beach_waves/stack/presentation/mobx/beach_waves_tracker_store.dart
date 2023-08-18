// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/movies/movies.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'beach_waves_tracker_store.g.dart';

class BeachWavesTrackerStore = _BeachWavesTrackerStoreBase
    with _$BeachWavesTrackerStore;

abstract class _BeachWavesTrackerStoreBase extends Equatable with Store {
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
  homeScreenSwipeUpCallback() {
    if (movieMode == MovieModes.onShore) {
      movieMode = MovieModes.oceanDiveSetup;
    }
  }

  @action
  onBeachWavesAnimationCompletion() {
    if (movieMode == MovieModes.backToShore) {
      Modular.to.navigate('/home/');
    } else if (movieMode == MovieModes.oceanDive) {
      movieMode = MovieModes.oceanDive;
      animationStatus = AnimationStatus.idle;
    }
  }

  @action
  initiateBackToShore() {
    movie = BackToShore.movie;
    control = Control.playFromStart;
    animationStatus = AnimationStatus.inProgress;
    movieMode = MovieModes.backToShore;
  }

  @action
  onShoreReturnComplete() {
    movie = OnShore.movie;
    control = Control.mirror;
    movieMode = MovieModes.onShore;
    animationStatus = AnimationStatus.idle;
  }

  @action
  collaboratorPhraseSwipeDownCallback() {
    if (animationStatus == AnimationStatus.idle &&
        movieMode == MovieModes.oceanDive) {
      initiateBackToShore();
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
  teeUpHomeScreenToCollabPoolNavigation({
    required double startingWaterMovement,
  }) {
    isReadyToTransition = true;
    passingParam = startingWaterMovement;
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
