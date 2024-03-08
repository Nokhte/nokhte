// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'static_depths_movie_store.g.dart';

class StaticDepthsMovieStore = _StaticDepthsMovieStoreBase
    with _$StaticDepthsMovieStore;

abstract class _StaticDepthsMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _StaticDepthsMovieStoreBase()
      : super(
          shouldPaintSand: StaticBeachWavesMovie.shouldPaintSand,
        ) {
    movie =
        StaticBeachWavesMovie.getMovie(WaterColorsAndStops.toTheDepthsWater);
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
