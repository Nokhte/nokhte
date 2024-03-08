// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'dynamic_point_to_half_and_and_half_movie_store.g.dart';

class DynamicPointToHalfAndHalfMovieStore = _DynamicPointToHalfAndHlafMovieStoreBase
    with _$DynamicPointToHalfAndHalfMovieStore;

abstract class _DynamicPointToHalfAndHlafMovieStoreBase
    extends BaseBeachWaveMovieStore<List<ColorAndStop>> with Store {
  _DynamicPointToHalfAndHlafMovieStoreBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.toTheDepthsWater,
    );
  }

  @override
  initMovie(List<ColorAndStop> param) {
    final halfAndHalf = WaterColorsAndStops.halfWaterAndSand;
    movie = TwoSecondBeachTransitionMovie.getMovie(param, halfAndHalf);
    control = Control.playFromStart;
  }
}
