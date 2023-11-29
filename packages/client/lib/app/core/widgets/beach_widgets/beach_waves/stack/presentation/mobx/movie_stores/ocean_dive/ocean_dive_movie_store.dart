// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/presentation/mobx/movie_stores/ocean_dive/ocean_dive.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'ocean_dive_movie_store.g.dart';

class OceanDiveMovieStore = _OceanDiveMovieStoreBase with _$OceanDiveMovieStore;

abstract class _OceanDiveMovieStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _OceanDiveMovieStoreBase() {
    movie = OceanDiveMovie.getOceanDiveMovie(startingWaterMovement: 0.0);
  }

  @action
  initMovie(double startingWaterPosition) {
    movie = OceanDiveMovie.getOceanDiveMovie(
        startingWaterMovement: startingWaterPosition);
    control = Control.play;
    movieStatus = MovieStatus.inProgress;
  }
}
