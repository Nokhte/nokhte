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
  MovieStatus movieStatus = MovieStatus.inProgress;

  @observable
  double passingParam = -10.0;

  @observable
  MovieModes movieMode = MovieModes.onShore;

  @observable
  Control control = Control.mirror;

  @observable
  int oceanDiveCount = 0;

  @action
  teeUpOceanDive() {
    if (movieMode == MovieModes.onShore) {
      movieMode = MovieModes.oceanDiveSetup;
    }
  }

  // @action
  initiateSuspendedAtSea() {
    movie = SuspendedAtSea.movie;
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
  initiateTimesUp({required Duration timerLength}) {
    movie = TimesUp.getMovie(
      timerLength: timerLength,
    );
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = MovieModes.timesUp;
  }

  @action
  onBeachWavesAnimationCompletion() {
    print("$movieMode");
    if (movieMode == MovieModes.backToShore) {
      Modular.to.navigate('/home/');
    } else if (movieMode == MovieModes.oceanDive) {
      oceanDiveCount != 0
          ? Modular.to.navigate('/p2p_collaborator_pool/')
          : oceanDiveCount++;
    } else if (movieMode == MovieModes.toTheDepths) {
      Modular.to.navigate('/p2p_collaborator_pool/pool/');
      // movieStatus = MovieStatus.idle;
    } else if (movieMode == MovieModes.timesUp) {
      initiateBackToOceanDive();
      // initiateBackToTheDepths();
    } else if (movieMode == MovieModes.backToOceanDive) {
      Modular.to.navigate(
        '/p2p_collaborator_pool/',
      );
    } else if (movieMode == MovieModes.backToTheDepths) {
      // from timer to session
      // initiateBackToTheDepths();
    }
  }

  @action
  initiateBackToTheDepths() {
    movie = BackToTheDepths.movie;
    control = Control.playFromStart;
    movieStatus = MovieStatus.inProgress;
    movieMode = MovieModes.backToTheDepths;
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
    print("teeOceanDiveMovieUP runs");
    movie = OceanDive.getOceanDiveMovie(
        startingWaterMovement: startingWaterMovement);
    control = Control.stop;
    initiateOceanDive();
  }

  @action
  teeUpOnShoreToOceanDiveTransition
      // teeUpHomeScreenToCollabPoolNavigation
      ({
    required double startingWaterMovement,
  }) {
    print("teeUpOnShoreToOceanDiveTransition runs");
    // isReadyToTransition = true;
    passingParam = startingWaterMovement;
  }

  @action
  initiateOceanDive() {
    print("initiateOceanDive runs");
    control = Control.playFromStart;
    // movieStatus = MovieStatus.inProgress;
    movieMode = MovieModes.oceanDive;
  }

  @override
  List<Object> get props => [];
}
