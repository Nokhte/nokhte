// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../shared/types/types.dart';
import '../../movies/movies.dart';

// * Mobx Codegen Inclusion
part 'beach_waves_tracker_store.g.dart';

class BeachWavesTrackerStore = _BeachWavesTrackerStoreBase
    with _$BeachWavesTrackerStore;

abstract class _BeachWavesTrackerStoreBase extends Equatable with Store {
  @observable
  MovieTween movie = OnShore.movie;

  @observable
  List<Color> pivotColorGradients = [];

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @observable
  double passingParam = -10.0;

  @observable
  BeachWaveMovieModes movieMode = BeachWaveMovieModes.onShore;

  @observable
  Control control = Control.mirror;

  int oceanDiveCount = 0;

  int backToTheDepthsCount = 0;

  int timesUpCount = 0;

  @action
  teeUpOceanDive() {
    if (movieMode == BeachWaveMovieModes.onShore) {
      movieMode = BeachWaveMovieModes.oceanDiveSetup;
    }
  }

  @action
  teeUpBackToTheDepths() {
    movieMode = BeachWaveMovieModes.backToTheDepthsSetup;
  }

  @action
  initiateSuspendedAtSea() {
    movie = SuspendedAtSea.movie;
    control = Control.playFromStart;
    movieMode = BeachWaveMovieModes.suspendedAtSea;
    movieStatus = MovieStatus.idle;
  }

  @action
  initiateSuspendedAtTheDepths() {
    movie = SuspendedAtTheDepths.movie;
    control = Control.playFromStart;
    movieMode = BeachWaveMovieModes.suspendedAtSea;
    movieStatus = MovieStatus.idle;
  }

  @action
  initShallowsToShore() {
    movie = ShallowsToShore.movie;
    control = Control.playFromStart;
    movieMode = BeachWaveMovieModes.shallowsToShore;
    movieStatus = MovieStatus.inProgress;
  }

  @action
  initiateToTheDepths() {
    movie = ToTheDepths.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.toTheDepths;
  }

  @action
  initiateTimesUp({
    required Duration timerLength,
  }) {
    movie = TimesUp.getMovie(
      timerLength: timerLength,
    );
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.timesUp;
  }

  // what we should do is have state change
  @action
  onBeachWavesAnimationCompletion() {
    switch (movieMode) {
      case BeachWaveMovieModes.oceanDive:
        oceanDiveCount != 0
            ? movieStatus = MovieStatus.finished
            : oceanDiveCount++;
        break;
      case BeachWaveMovieModes.backToTheDepths:
        backToTheDepthsCount != 0
            ? movieStatus = MovieStatus.finished
            : backToTheDepthsCount++;
        break;
      default:
        movieStatus = MovieStatus.finished;
        break;
    }
  }

  @action
  initiateBackToOceanDive() {
    movie = BackToOceanDive.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.backToOceanDive;
  }

  @action
  initiateBackToShore() {
    movie = BackToShore.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.backToShore;
  }

  @action
  initiateTestTheWaters() {
    // movie = TestTheWaters.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.backToShore;
  }

  @action
  onShoreReturnComplete() {
    movie = OnShore.movie;
    control = Control.mirror;
    movieMode = BeachWaveMovieModes.onShore;
    movieStatus = MovieStatus.idle;
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
  teeUpBackToTheDepthsValues({
    required List<Color> colorGradientsList,
  }) {
    pivotColorGradients = colorGradientsList;
    initiateBackToTheDepths();
  }

  @action
  initiateBackToTheDepths() {
    movie = BackToTheDepths.getMovie(
      startingFirstGradient: pivotColorGradients[0],
      startingSecondGradient: pivotColorGradients[1],
      startingThirdGradient: pivotColorGradients[2],
      startingFourthGradient: pivotColorGradients[3],
      startingFifthGradient: pivotColorGradients[4],
      startingSixthGradient: pivotColorGradients[5],
      startingSeventhGradient: pivotColorGradients[6],
      startingEighthGradient: pivotColorGradients[7],
    );
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.backToTheDepths;
  }

  @action
  teeUpOnShoreToOceanDiveTransition({
    required double startingWaterMovement,
  }) {
    passingParam = startingWaterMovement;
  }

  @action
  initiateOceanDive() {
    movieStatus = MovieStatus.inProgress;
    control = Control.playFromStart;
    movieMode = BeachWaveMovieModes.oceanDive;
  }

  @override
  List<Object> get props => [];
}
