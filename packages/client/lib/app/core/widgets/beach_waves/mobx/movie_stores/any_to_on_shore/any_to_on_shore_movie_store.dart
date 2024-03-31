// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'any_to_on_shore_movie_store.g.dart';

class AnyToOnShoreMovieStore = _AnyToOnShoreMovieStoreBase
    with _$AnyToOnShoreMovieStore;

abstract class _AnyToOnShoreMovieStoreBase
    extends BaseBeachWaveMovieStore<List<ColorAndStop>> with Store {
  _AnyToOnShoreMovieStoreBase()
      : super(
          shouldPaintSand: AnyToShoreMovie.shouldPaintSand,
        ) {
    movie = AnyToShoreMovie.getMovie(WaterColorsAndStops.oceanDiveWater);
  }
  @override
  @action
  initMovie(List<ColorAndStop> params) {
    movie = AnyToShoreMovie.getMovie(params);
    control = Control.playFromStart;
  }
}
