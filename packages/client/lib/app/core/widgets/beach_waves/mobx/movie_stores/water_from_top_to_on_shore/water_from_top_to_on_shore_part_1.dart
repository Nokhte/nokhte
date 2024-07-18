// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'water_from_top_to_on_shore_movie_part_1.dart';
part 'water_from_top_to_on_shore_part_1.g.dart';

class WaterFromTopToOnShorePart1 = _WaterFromTopToOnShorePart1Base
    with _$WaterFromTopToOnShorePart1;

abstract class _WaterFromTopToOnShorePart1Base
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _WaterFromTopToOnShorePart1Base()
      : super(
          shouldPaintSand: WaterFromTopToOnShoreMoviePart1.shouldPaintSand,
          callsOnCompleteTwice: true,
        ) {
    movie = WaterFromTopToOnShoreMoviePart1.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
