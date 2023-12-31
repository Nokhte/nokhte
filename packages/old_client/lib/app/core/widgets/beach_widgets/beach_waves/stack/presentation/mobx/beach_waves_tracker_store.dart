// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:core';
part 'beach_waves_tracker_store.g.dart';

class BeachWavesTrackerStore = _BeachWavesTrackerStoreBase
    with _$BeachWavesTrackerStore;

abstract class _BeachWavesTrackerStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _BeachWavesTrackerStoreBase() {
    movie = OnShore.movie;
  }

  @observable
  List<Color> pivotColorGradients = [];

  @observable
  double lastWaterValue = -10.0;

  @observable
  BeachWaveMovieModes movieMode = BeachWaveMovieModes.onShore;

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
    movie = TimesUp.getMovie(timerLength: timerLength);
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.timesUp;
  }

  @action
  initiateBackToOceanDive() {
    movie = BackToOceanDive.movie;
    control = Control.playFromStart;
    setMovieStatus(MovieStatus.inProgress);
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
    control = Control.playFromStart;
    pivotColorGradients = colorGradientsList;
    initiateBackToTheDepths();
  }

  @action
  initiateBackToTheDepths() {
    movie = BackToTheDepths.getMovie(
      startingFirstGradient: pivotColorGradients.first,
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
    lastWaterValue = startingWaterMovement;
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
