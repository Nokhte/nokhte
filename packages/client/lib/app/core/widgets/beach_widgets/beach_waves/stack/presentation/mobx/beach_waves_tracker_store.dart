// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:core';
import '../../../../shared/types/types.dart';
import '../../movies/movies.dart';
part 'beach_waves_tracker_store.g.dart';

class BeachWavesTrackerStore = _BeachWavesTrackerStoreBase
    with _$BeachWavesTrackerStore;

abstract class _BeachWavesTrackerStoreBase extends Equatable with Store {
  _BeachWavesTrackerStoreBase() {
    controlListener();
    stopwatchListener();
  }

  @observable
  MovieTween movie = OnShore.movie;

  @observable
  bool showWidget = true;

  @action
  toggleWidgetVisibilty() => showWidget = !showWidget;

  @observable
  List<Color> pivotColorGradients = [];

  @observable
  Stopwatch localStopwatch = Stopwatch();

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @action
  void setMovie(MovieTween newMovie) => movie = newMovie;

  @action
  void setControl(Control newControl) => control = newControl;

  @observable
  double passingParam = -10.0;

  @observable
  BeachWaveMovieModes movieMode = BeachWaveMovieModes.onShore;

  @observable
  Control control = Control.mirror;

  int oceanDiveCount = 0;

  int backToTheDepthsCount = 0;

  int timesUpCount = 0;

  @observable
  String stopwatchMillseconds = "";

  @action
  teeUpOceanDive() {
    if (movieMode == BeachWaveMovieModes.onShore) {
      movieMode = BeachWaveMovieModes.oceanDiveSetup;
    }
  }

  @action
  startAndResetStopWatch() {
    print("is this running?????? stopwatch starter??");
    localStopwatch.reset();
    localStopwatch.start();
    print("${localStopwatch.elapsedMilliseconds}");
    Timer.periodic(Seconds.get(0, milli: 1), (timer) {
      stopwatchMillseconds = localStopwatch.elapsedMilliseconds.toString();
      if (movieStatus == MovieStatus.finished) {
        timer.cancel();
      }
    });
  }

  controlListener() => reaction((p0) => control, (p0) {
        print("is this running the rxn $p0");
        if (control == Control.playFromStart) {
          // localStopwatch.reset();
          localStopwatch.start();
        } else if (control == Control.play) {
          // if (!localStopwatch.isRunning) {
          localStopwatch.start();
          print("start ${localStopwatch.elapsedMilliseconds}");
          // }
        } else if (control == Control.stop) {
          localStopwatch.stop();
          print("stop ${localStopwatch.elapsedMilliseconds}");
        }
      });

  stopwatchListener() => reaction((p0) => stopwatchMillseconds, (p0) {
        // print(" $p0 == ?? ${movie.duration.inMilliseconds}");
        if ((movie.duration.inMilliseconds - int.parse(p0)) < 1000) {
          print("milllllli $p0");
        }
        if (p0 == movie.duration.inMilliseconds.toString()) {
          print("IT'S FINISHED!!!! $p0");
          movieStatus = MovieStatus.finished;
        } else if (int.parse(p0) > movie.duration.inMilliseconds) {
          localStopwatch.stop();
          localStopwatch.reset();
        }
      });

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
    movie = TimesUp.getMovie(
      timerLength: timerLength,
    );
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = BeachWaveMovieModes.timesUp;
  }

  @action
  onBeachWavesAnimationCompletion() {
    // switch (movieMode) {
    //   case BeachWaveMovieModes.oceanDive:
    //     oceanDiveCount != 0
    //         ? movieStatus = MovieStatus.finished
    //         : oceanDiveCount++;
    //     break;
    //   case BeachWaveMovieModes.backToTheDepths:
    //     backToTheDepthsCount != 0
    //         ? movieStatus = MovieStatus.finished
    //         : backToTheDepthsCount++;
    //     break;
    // default:
    // if (control == Control.stop) {
    //   final pastMovie = movie;
    //   movie = MovieTween();
    //   movie = pastMovie;
    // onBeachWavesAnimationCompletion();
    // control = Control.play;
    //   return;
    // }
    // movieStatus = MovieStatus.finished;

    // break;
    // }
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
