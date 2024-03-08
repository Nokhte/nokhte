// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'depths_to_times_up_start_movie_store.g.dart';

class DepthsToTimesUpStartMovieStore = _DepthsToTimesUpStartMovieStoreBase
    with _$DepthsToTimesUpStartMovieStore;

abstract class _DepthsToTimesUpStartMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _DepthsToTimesUpStartMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.timesUpPhase1,
    );
  }

  @override
  initMovie(NoParams params) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.toTheDepthsWater,
      WaterColorsAndStops.timesUpPhase1,
    );
    control = Control.playFromStart;
  }
}
