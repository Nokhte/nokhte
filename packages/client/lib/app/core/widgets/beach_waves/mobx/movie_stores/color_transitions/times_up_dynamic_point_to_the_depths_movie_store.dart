// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'times_up_dynamic_point_to_the_depths_movie_store.g.dart';

class TimesUpDynamicPointToTheDepthsMovieStore = _TimesUpDynamicPointToTheDepthsMovieStoreBase
    with _$TimesUpDynamicPointToTheDepthsMovieStore;

abstract class _TimesUpDynamicPointToTheDepthsMovieStoreBase
    extends BaseBeachWaveMovieStore<List<ColorAndStop>> with Store {
  _TimesUpDynamicPointToTheDepthsMovieStoreBase()
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
    TwoSecondBeachTransitionMovie.getMovie(
      param,
      WaterColorsAndStops.toTheDepthsWater,
    );
    control = Control.playFromStart;
  }
}
