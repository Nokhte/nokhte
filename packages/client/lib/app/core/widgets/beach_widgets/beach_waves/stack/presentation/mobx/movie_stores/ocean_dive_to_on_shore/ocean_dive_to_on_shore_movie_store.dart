// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'ocean_dive_to_on_shore_movie_store.g.dart';

class OceanDiveToOnShoreMovieStore = _OceanDiveToOnShoreMovieStoreBase
    with _$OceanDiveToOnShoreMovieStore;

abstract class _OceanDiveToOnShoreMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _OceanDiveToOnShoreMovieStoreBase()
      : super(
          shouldPaintSand: OceanDiveToShoreMovie.shouldPaintSand,
        ) {
    movie = OceanDiveToShoreMovie.movie;
  }
  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
