// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'any_to_inverted_half_and_and_half_movie_store.g.dart';

class AnyToInvertedHalfAndHalfMovieStore = _AnyToInvertedHalfAndHalfMovieStoreBase
    with _$AnyToInvertedHalfAndHalfMovieStore;

abstract class _AnyToInvertedHalfAndHalfMovieStoreBase
    extends BaseBeachWaveMovieStore<List<ColorAndStop>> with Store {
  _AnyToInvertedHalfAndHalfMovieStoreBase()
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
    const halfAndHalf = WaterColorsAndStops.invertedHalfWaterAndSand;
    movie = TwoSecondBeachTransitionMovie.getMovie(param, halfAndHalf);
    control = Control.playFromStart;
  }
}