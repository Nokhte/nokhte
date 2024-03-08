// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'static_half_and_half_movie_store.g.dart';

class StaticHalfAndHalfMovieStore = _StaticHalfAndHalfMovieStoreBase
    with _$StaticHalfAndHalfMovieStore;

abstract class _StaticHalfAndHalfMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _StaticHalfAndHalfMovieStoreBase()
      : super(shouldPaintSand: StaticBeachWavesMovie.shouldPaintSand) {
    movie =
        StaticBeachWavesMovie.getMovie(WaterColorsAndStops.halfWaterAndSand);
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
