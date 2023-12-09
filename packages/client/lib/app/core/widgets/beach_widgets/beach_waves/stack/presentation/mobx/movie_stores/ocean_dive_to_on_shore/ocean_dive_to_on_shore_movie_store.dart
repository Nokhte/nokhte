// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/presentation/mobx/movie_stores/ocean_dive_to_on_shore/ocean_dive_to_on_shore_movie.dart';
import 'package:simple_animations/simple_animations.dart';
part 'ocean_dive_to_on_shore_movie_store.g.dart';

class OceanDiveToOnShoreMovieStore = _OceanDiveToOnShoreMovieStoreBase
    with _$OceanDiveToOnShoreMovieStore;

abstract class _OceanDiveToOnShoreMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _OceanDiveToOnShoreMovieStoreBase() {
    movie = OceanDiveToShoreMovie.movie;
  }
  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
