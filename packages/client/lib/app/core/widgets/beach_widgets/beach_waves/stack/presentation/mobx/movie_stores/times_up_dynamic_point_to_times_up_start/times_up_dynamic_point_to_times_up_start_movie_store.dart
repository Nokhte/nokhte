// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/movies/times_up_dynamic_point_to_dynamic_end.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'times_up_dynamic_point_to_times_up_start_movie_store.g.dart';

class TimesUpDynamicPointToTimesUpStartMovieStore = _TimesUpDynamicPointToTimesUpStartMovieStoreBase
    with _$TimesUpDynamicPointToTimesUpStartMovieStore;

abstract class _TimesUpDynamicPointToTimesUpStartMovieStoreBase
    extends BaseBeachWaveMovieStore<List<ColorAndStop>> with Store {
  _TimesUpDynamicPointToTimesUpStartMovieStoreBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: TimesUpDynamicPointToDynamicEndMovie.shouldPaintSand,
        ) {
    movie = TimesUpDynamicPointToDynamicEndMovie.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.toTheDepthsWater,
    );
  }

  @override
  initMovie(List<ColorAndStop> param) {
    final timesUpPhase1 = WaterColorsAndStops.timesUpPhase1;
    movie = TimesUpDynamicPointToDynamicEndMovie.getMovie(param, timesUpPhase1);
    control = Control.playFromStart;
  }
}
