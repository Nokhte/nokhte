// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'static_black_out_movie_store.g.dart';

class StaticBlackOutMovieStore = _StaticBlackOutMovieStoreBase
    with _$StaticBlackOutMovieStore;

abstract class _StaticBlackOutMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _StaticBlackOutMovieStoreBase()
      : super(shouldPaintSand: StaticBeachWavesMovie.shouldPaintSand) {
    movie = StaticBeachWavesMovie.getMovie(WaterColorsAndStops.blackOut);
  }
  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
