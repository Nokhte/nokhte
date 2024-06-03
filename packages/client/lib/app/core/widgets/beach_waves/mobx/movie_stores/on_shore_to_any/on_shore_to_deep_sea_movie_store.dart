// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'on_shore_to_deep_sea_movie_store.g.dart';

class OnShoreToDeepSeaMovieStore = _OnShoreToOceanDeepSeaStoreBase
    with _$OnShoreToDeepSeaMovieStore;

abstract class _OnShoreToOceanDeepSeaStoreBase
    extends BaseBeachWaveMovieStore<double> with Store {
  _OnShoreToOceanDeepSeaStoreBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: OnShoreToAny.shouldPaintSand,
        ) {
    movie = OnShoreMovie.movie;
  }

  @override
  @action
  initMovie(double startingWaterPosition) {
    setMovie(
      OnShoreToAny.getMovie(
        startingWaterMovement: startingWaterPosition,
        endingColors: WaterColorsAndStops.deepSeaWater,
      ),
    );
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }
}
