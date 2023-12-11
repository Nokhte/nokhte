// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'water_from_top_to_on_shore_movie_part_1_store.g.dart';

class WaterFromTopToOnShoreMoviePart1Store = _WaterFromTopToOnShorePart1MovieStoreBase
    with _$WaterFromTopToOnShoreMoviePart1Store;

abstract class _WaterFromTopToOnShorePart1MovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _WaterFromTopToOnShorePart1MovieStoreBase()
      : super(
          shouldPaintSand: WaterFromTopToOnShoreMoviePart1.shouldPaintSand,
        ) {
    movie = WaterFromTopToOnShoreMoviePart1.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
