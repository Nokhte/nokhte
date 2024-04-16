// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'half_and_half_to_dry_sand_movie_store.g.dart';

class HalfAndHalfToDrySandMovieStore = _HalfAndHalfToDrySandMovieStoreBase
    with _$HalfAndHalfToDrySandMovieStore;

abstract class _HalfAndHalfToDrySandMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _HalfAndHalfToDrySandMovieStoreBase()
      : super(
          shouldPaintSand: TwoSecondBeachTransitionMovie.shouldPaintSand,
          callsOnCompleteTwice: false,
        ) {
    movie = TwoSecondBeachTransitionMovie.getMovie(
      WaterColorsAndStops.halfWaterAndSand,
      WaterColorsAndStops.condensedDrySand,
    );
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
