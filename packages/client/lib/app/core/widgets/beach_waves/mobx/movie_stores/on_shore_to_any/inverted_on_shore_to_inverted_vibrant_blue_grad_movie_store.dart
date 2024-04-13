// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'inverted_on_shore_to_inverted_vibrant_blue_grad_movie_store.g.dart';

class InvertedOnShoreToInvertedVibrantBlueGradMovieStore = _InvertedOnShoreToOceanInvertedVibrantBlueGradStoreBase
    with _$InvertedOnShoreToInvertedVibrantBlueGradMovieStore;

abstract class _InvertedOnShoreToOceanInvertedVibrantBlueGradStoreBase
    extends BaseBeachWaveMovieStore<double> with Store {
  _InvertedOnShoreToOceanInvertedVibrantBlueGradStoreBase()
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
        startingColors: WaterColorsAndStops.invertedBeachWater,
        startingWaterMovement: startingWaterPosition,
        endingColors: WaterColorsAndStops.invertedVibrantBlueGrad,
      ),
    );
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }
}
