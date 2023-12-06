// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:simple_animations/simple_animations.dart';

import 'on_shore_to_ocean_dive_movie.dart';
// * Mobx Codegen Inclusion
part 'on_shore_to_ocean_dive_movie_store.g.dart';

class OnShoreToOceanDiveMovieStore = _OnShoreToOceanDiveMovieStoreBase
    with _$OnShoreToOceanDiveMovieStore;

abstract class _OnShoreToOceanDiveMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<double> with Store {
  _OnShoreToOceanDiveMovieStoreBase() : super(callsOnCompleteTwice: true) {
    movie =
        OnShoreToOceanDiveMovie.getOceanDiveMovie(startingWaterMovement: 0.0);
    // control = Control.playFromStart;
  }

  @override
  @action
  initMovie(double startingWaterPosition) {
    movie = OnShoreToOceanDiveMovie.getOceanDiveMovie(
        startingWaterMovement: startingWaterPosition);
    control = Control.playFromStart;
  }
}
