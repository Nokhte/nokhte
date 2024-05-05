// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'any_to_half_and_and_half_movie_store.g.dart';

class AnyToHalfAndHalfMovieStore = _AnyToHalfAndHlafMovieStoreBase
    with _$AnyToHalfAndHalfMovieStore;

abstract class _AnyToHalfAndHlafMovieStoreBase
    extends BaseBeachWaveMovieStore<List<ColorAndStop>> with Store {
  _AnyToHalfAndHlafMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.toTheDepthsWater,
    );
  }

  @override
  initMovie(List<ColorAndStop> param) {
    const halfAndHalf = WaterColorsAndStops.halfWaterAndSand;
    movie = TwoSecondBeachTransitionMovie.getMovie(param, halfAndHalf);
    control = Control.playFromStart;
  }
}
