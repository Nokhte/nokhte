// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
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
  List<Color> pivotColorGradients = [];

  @observable
  MovieStatus movieStatus = MovieStatus.inProgress;

  @observable
  double passingParam = -10.0;

  @observable
  MovieModes movieMode = MovieModes.onShore;

  @observable
  Control control = Control.mirror;

  int oceanDiveCount = 0;

  int backToTheDepthsCount = 0;

  int timesUpCount = 0;

  @action
  teeUpOceanDive() {
    if (movieMode == MovieModes.onShore) {
      movieMode = MovieModes.oceanDiveSetup;
    }
  }

  @action
  teeUpBackToTheDepths() {
    movieMode = MovieModes.backToTheDepthsSetup;
  }

  @action
  initiateSuspendedAtSea() {
    movie = SuspendedAtSea.movie;
    control = Control.playFromStart;
    movieMode = MovieModes.suspendedAtSea;
    movieStatus = MovieStatus.idle;
  }

  @action
  initiateSuspendedAtTheDepths() {
    movie = SuspendedAtTheDepths.movie;
    control = Control.playFromStart;
    movieMode = MovieModes.suspendedAtSea;
    movieStatus = MovieStatus.idle;
  }

  @action
  initiateToTheDepths() {
    movie = ToTheDepths.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = MovieModes.toTheDepths;
  }

  @action
  initiateTimesUp({
    required Duration timerLength,
    required MovieModes pMovieMode,
  }) {
    movie = TimesUp.getMovie(
      timerLength: timerLength,
    );
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = pMovieMode;
  }

  /// I think the best way to do is probably to parameterize it
  /// ??
  @action
  onBeachWavesAnimationCompletion() {
    switch (movieMode) {
      case MovieModes.backToShore:
        Modular.to.navigate('/home/');
        break;
      case MovieModes.oceanDive:
        oceanDiveCount != 0
            ? Modular.to.navigate('/p2p_collaborator_pool/')
            : oceanDiveCount++;
        break;
      case MovieModes.toTheDepths:
        Modular.to.navigate('/p2p_collaborator_pool/pool/');
        break;
      case MovieModes.collaboratorPoolTimesUp:
        initiateBackToOceanDive();
        break;
      case MovieModes.backToOceanDive:
        Modular.to.navigate(
          '/p2p_collaborator_pool/',
        );
        break;
      case MovieModes.enterThePurposeSessionDepths:
        backToTheDepthsCount != 0
            ? Modular.to.navigate('/p2p_purpose_session/')
            : backToTheDepthsCount++;
        break;
      case MovieModes.enterPhase3Depths:
        Modular.to.navigate('/p2p_purpose_session/phase-3/');
        break;
      case MovieModes.purposeCallTimesUp:
        timesUpCount != 0 ? teeUpBackToTheDepths() : timesUpCount++;

      // initiateBackToTheDepths();

      default:
        break;
    }
    // if (movieMode == MovieModes.backToShore) {
    //   Modular.to.navigate('/home/');
    // } else if (movieMode == MovieModes.oceanDive) {
    //   oceanDiveCount != 0
    //       ? Modular.to.navigate('/p2p_collaborator_pool/')
    //       : oceanDiveCount++;
    // } else if (movieMode == MovieModes.toTheDepths) {
    //   Modular.to.navigate('/p2p_collaborator_pool/pool/');
    // } else if (movieMode == MovieModes.collaboratorPoolTimesUp) {
    //   initiateBackToOceanDive();
    // } else if (movieMode == MovieModes.backToOceanDive) {
    //   Modular.to.navigate(
    //     '/p2p_collaborator_pool/',
    //   );
    // } else if (movieMode == MovieModes.backToTheDepths) {
    //   backToTheDepthsCount != 0
    //       ? Modular.to.navigate('/p2p_purpose_session/')
    //       : backToTheDepthsCount++;
    // }
  }

  @action
  initiateBackToOceanDive() {
    movie = BackToOceanDive.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = MovieModes.backToOceanDive;
  }

  @action
  initiateBackToShore() {
    movie = BackToShore.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = MovieModes.backToShore;
  }

  @action
  onShoreReturnComplete() {
    movie = OnShore.movie;
    control = Control.mirror;
    movieMode = MovieModes.onShore;
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
    movieMode = movieMode == MovieModes.enterThePurposeSessionDepths
        ? MovieModes.enterThePurposeSessionDepths
        : MovieModes.enterPhase3Depths;
    // movieMode = MovieModes.backToTheDepths;
  }

  @action
  teeUpOnShoreToOceanDiveTransition
      // teeUpHomeScreenToCollabPoolNavigation
      ({
    required double startingWaterMovement,
  }) {
    // isReadyToTransition = true;
    passingParam = startingWaterMovement;
  }

  @action
  initiateOceanDive() {
    control = Control.playFromStart;
    // movieStatus = MovieStatus.inProgress;
    movieMode = MovieModes.oceanDive;
  }

  @override
  List<Object> get props => [];
}
