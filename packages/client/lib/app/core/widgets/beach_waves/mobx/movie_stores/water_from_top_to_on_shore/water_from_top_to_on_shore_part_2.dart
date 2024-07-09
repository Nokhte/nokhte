// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
export 'water_from_top_to_on_shore_movie_part_2.dart';
part 'water_from_top_to_on_shore_part_2.g.dart';

class WaterFromTopToOnShorePart2 = _WaterFromTopToOnShorePart2Base
    with _$WaterFromTopToOnShorePart2;

abstract class _WaterFromTopToOnShorePart2Base
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _WaterFromTopToOnShorePart2Base()
      : super(
          shouldPaintSand: WaterFromTopToOnShoreMoviePart2.shouldPaintSand,
        ) {
    movie = WaterFromTopToOnShoreMoviePart2.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
