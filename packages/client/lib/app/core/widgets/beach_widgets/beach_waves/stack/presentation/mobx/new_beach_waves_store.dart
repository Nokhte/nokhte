// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/presentation/mobx/movie_stores/times_up_end_to_ocean_dive/times_up_end_to_ocean_dive.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'dart:core';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';
part 'new_beach_waves_store.g.dart';

class NewBeachWavesStore = _NewBeachWavesStoreBase with _$NewBeachWavesStore;

abstract class _NewBeachWavesStoreBase extends Equatable with Store {
  final OnShoreToOceanDiveMovieStore onShoreToOceanDiveMovieStore;
  final OnShoreMovieStore onShoreMovieStore;
  final OceanDiveToOnShoreMovieStore oceanDiveToOnShoreMovieStore;
  final SuspendedAtOceanDiveStore suspendedAtOceanDiveStore;
  final OceanDiveToTimesUpMovieStore oceanDiveToTimesUpMovieStore;
  final TimesUpMovieStore timesUpMovieStore;
  final TimesUpEndToOceanDiveMovieStore timesUpEndToOceanDiveMovie;
  final TimesUpDynamicPointToTheDepthsMovieStore
      timesUpDynamicPointToTheDepthsMovie;

  _NewBeachWavesStoreBase({
    required this.timesUpDynamicPointToTheDepthsMovie,
    required this.timesUpEndToOceanDiveMovie,
    required this.timesUpMovieStore,
    required this.oceanDiveToTimesUpMovieStore,
    required this.onShoreToOceanDiveMovieStore,
    required this.suspendedAtOceanDiveStore,
    required this.onShoreMovieStore,
    required this.oceanDiveToOnShoreMovieStore,
  }) {
    movieModeToStoreLookup = {
      BeachWaveMovieModes.none: BaseCustomAnimatedWidgetStore(),
      BeachWaveMovieModes.onShoreToOceanDiveSetup: onShoreMovieStore,
      BeachWaveMovieModes.onShoreToOceanDive: onShoreToOceanDiveMovieStore,
      BeachWaveMovieModes.oceanDiveToOnShore: oceanDiveToOnShoreMovieStore,
      BeachWaveMovieModes.onShore: onShoreMovieStore,
      BeachWaveMovieModes.suspendedAtOceanDive: suspendedAtOceanDiveStore,
      BeachWaveMovieModes.oceanDiveToTimesUp: oceanDiveToTimesUpMovieStore,
      BeachWaveMovieModes.timesUp: timesUpMovieStore,
      BeachWaveMovieModes.timesUpEndToOceanDive: timesUpEndToOceanDiveMovie,
      BeachWaveMovieModes.timesUpDynamicPointToTheDepths:
          timesUpDynamicPointToTheDepthsMovie,
      BeachWaveMovieModes.timesUpDynamicPointToTheDepthsSetup:
          timesUpMovieStore,
    };
  }

  Map<BeachWaveMovieModes, BaseCustomAnimatedWidgetStore>
      movieModeToStoreLookup = {
    BeachWaveMovieModes.none: BaseCustomAnimatedWidgetStore(),
  };

  @observable
  int finishedCount = 0;

  @action
  onCompleted() {
    if (currentStore.callsOnCompleteTwice) {
      print("what happened $movieMode $movieStatus");
      if (finishedCount == 0) {
        finishedCount++;
      } else {
        movieStatus = MovieStatus.finished;
      }
    } else {
      movieStatus = MovieStatus.finished;
    }
  }

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @observable
  BeachWaveMovieModes movieMode = BeachWaveMovieModes.none;

  @action
  setMovieMode(BeachWaveMovieModes newMovieMode) {
    movieStatus = MovieStatus.idle;
    movieMode = newMovieMode;
  }

  @computed
  BaseCustomAnimatedWidgetStore get currentStore =>
      movieModeToStoreLookup[movieMode] ?? BaseCustomAnimatedWidgetStore();

  @computed
  Control get currentControl =>
      movieModeToStoreLookup[movieMode]?.control ?? Control.stop;

  @computed
  MovieStatus get currentMovieStatus =>
      movieModeToStoreLookup[movieMode]?.movieStatus ?? MovieStatus.idle;

  @computed
  MovieTween get currentMovie =>
      movieModeToStoreLookup[movieMode]?.movie ?? MovieTween();

  @override
  List<Object> get props => [];
}
