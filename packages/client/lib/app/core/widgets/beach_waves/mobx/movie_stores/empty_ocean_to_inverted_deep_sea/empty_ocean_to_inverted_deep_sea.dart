// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'empty_ocean_to_inverted_deep_sea_movie.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'empty_ocean_to_inverted_deep_sea.g.dart';

class EmptyOceanToInvertedDeepSea = _EmptyOceanToInvertedDeepSeaBase
    with _$EmptyOceanToInvertedDeepSea;
//

abstract class _EmptyOceanToInvertedDeepSeaBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _EmptyOceanToInvertedDeepSeaBase()
      : super(
          callsOnCompleteTwice: false,
          shouldPaintSand: AnyToShoreMovie.shouldPaintSand,
        ) {
    movie = EmptyOceanToInvertedDeepSeaMovie.getMovie();
  }
  @override
  @action
  initMovie(NoParams params) {
    movie = EmptyOceanToInvertedDeepSeaMovie.getMovie();
    control = Control.playFromStart;
  }

  @override
  @action
  reverseMovie(NoParams params) {
    movie = EmptyOceanToInvertedDeepSeaMovie.getMovie();
    control = Control.playReverseFromEnd;
  }
}
