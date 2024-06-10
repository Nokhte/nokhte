// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'static_inverted_deeper_blue_movie_store.g.dart';

class StaticInvertedDeeperBlueMovieStore = _StaticInvertedDeeperBlueMovieStoreBase
    with _$StaticInvertedDeeperBlueMovieStore;

abstract class _StaticInvertedDeeperBlueMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _StaticInvertedDeeperBlueMovieStoreBase()
      : super(
          shouldPaintSand: StaticBeachWavesMovie.shouldPaintSand,
        ) {
    movie =
        StaticBeachWavesMovie.getMovie(WaterColorsAndStops.invertedDeeperBlue);
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
