// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'dart:core';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';
part 'beach_waves_store.g.dart';

class BeachWavesStore = _BeachWavesStoreBase with _$BeachWavesStore;

abstract class _BeachWavesStoreBase extends Equatable with Store {
  final BlackOutMovieStore blackOutMovie;
  final BlackOutToDrySandMovieStore blackOutToDrySandMovieStore;
  final OceanDiveToOnShoreMovieStore oceanDiveToOnShoreMovieStore;
  final OceanDiveToTimesUpStartMovieStore oceanDiveToTimesUpStartMovieStore;
  final OnShoreToOceanDiveMovieStore onShoreToOceanDiveMovieStore;
  final OnShoreMovieStore onShoreMovieStore;
  final SuspendedAtOceanDiveStore suspendedAtOceanDiveStore;
  final SuspendedAtTheDepthsMovieStore suspendedAtTheDepthsMovieStore;
  final TimesUpMovieStore timesUpMovieStore;
  final TimesUpDynamicPointToTheDepthsMovieStore
      timesUpDynamicPointToTheDepthsMovie;
  final TimesUpEndToOceanDiveMovieStore timesUpEndToOceanDiveMovie;
  final TimesUpEndToTheDepthsMovieStore timesUpEndToTheDepthsMovieStore;

  _BeachWavesStoreBase({
    required this.blackOutMovie,
    required this.blackOutToDrySandMovieStore,
    required this.oceanDiveToOnShoreMovieStore,
    required this.oceanDiveToTimesUpStartMovieStore,
    required this.onShoreToOceanDiveMovieStore,
    required this.onShoreMovieStore,
    required this.suspendedAtOceanDiveStore,
    required this.suspendedAtTheDepthsMovieStore,
    required this.timesUpMovieStore,
    required this.timesUpDynamicPointToTheDepthsMovie,
    required this.timesUpEndToOceanDiveMovie,
    required this.timesUpEndToTheDepthsMovieStore,
  }) {
    movieModeToStoreLookup = {
      BeachWaveMovieModes.blackOut: blackOutMovie,
      BeachWaveMovieModes.oceanDiveToTimesUp: oceanDiveToTimesUpStartMovieStore,
      BeachWaveMovieModes.oceanDiveToOnShore: oceanDiveToOnShoreMovieStore,
      BeachWaveMovieModes.onShore: onShoreMovieStore,
      BeachWaveMovieModes.onShoreToOceanDive: onShoreToOceanDiveMovieStore,
      BeachWaveMovieModes.onShoreToOceanDiveSetup: onShoreMovieStore,
      BeachWaveMovieModes.none: BaseCustomAnimatedWidgetStore(),
      BeachWaveMovieModes.timesUp: timesUpMovieStore,
      BeachWaveMovieModes.timesUpDynamicPointToTheDepths:
          timesUpDynamicPointToTheDepthsMovie,
      BeachWaveMovieModes.timesUpDynamicPointToTheDepthsSetup:
          timesUpMovieStore,
      BeachWaveMovieModes.timesUpEndToTheDepths:
          timesUpEndToTheDepthsMovieStore,
      BeachWaveMovieModes.timesUpEndToOceanDive: timesUpEndToOceanDiveMovie,
      BeachWaveMovieModes.suspendedAtOceanDive: suspendedAtOceanDiveStore,
      BeachWaveMovieModes.suspendedAtTheDepths: suspendedAtTheDepthsMovieStore,
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
  ObservableList<ColorAndStop> pivotColors = ObservableList.of([]);

  @action
  setPivotColors(List currentAnimationValues) {
    pivotColors = ObservableList.of([
      ColorAndStop(currentAnimationValues[1], currentAnimationValues[9]),
      ColorAndStop(currentAnimationValues[2], currentAnimationValues[10]),
      ColorAndStop(currentAnimationValues[3], currentAnimationValues[11]),
      ColorAndStop(currentAnimationValues[4], currentAnimationValues[12]),
      ColorAndStop(currentAnimationValues[5], currentAnimationValues[13]),
      ColorAndStop(currentAnimationValues[6], currentAnimationValues[14]),
      ColorAndStop(currentAnimationValues[7], currentAnimationValues[15]),
      ColorAndStop(currentAnimationValues[8], currentAnimationValues[16]),
    ]);
  }

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @observable
  BeachWaveMovieModes movieMode = BeachWaveMovieModes.onShore;

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
