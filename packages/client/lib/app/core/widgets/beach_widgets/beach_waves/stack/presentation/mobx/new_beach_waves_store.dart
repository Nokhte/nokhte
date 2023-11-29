// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:equatable/equatable.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'dart:core';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:simple_animations/simple_animations.dart';
part 'new_beach_waves_store.g.dart';

class NewBeachWavesStore = _NewBeachWavesStoreBase with _$NewBeachWavesStore;

abstract class _NewBeachWavesStoreBase extends Equatable with Store {
  final OceanDiveMovieStore oceanDiveMovieStore;
  final OnShoreMovieStore onShoreMovieStore;
  _NewBeachWavesStoreBase({
    required this.oceanDiveMovieStore,
    required this.onShoreMovieStore,
  }) {
    movieModeToStoreLookup = {
      BeachWaveMovieModes.none: BaseCustomAnimatedWidgetStore(),
      BeachWaveMovieModes.oceanDiveSetup: onShoreMovieStore,
      BeachWaveMovieModes.oceanDive: oceanDiveMovieStore,
      BeachWaveMovieModes.onShore: onShoreMovieStore,
    };
  }

  Map<BeachWaveMovieModes, BaseCustomAnimatedWidgetStore>
      movieModeToStoreLookup = {
    BeachWaveMovieModes.none: BaseCustomAnimatedWidgetStore(),
  };

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @action
  onCompleted() {
    print("onCompleted $movieMode");
    movieStatus = MovieStatus.finished;
  }

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
