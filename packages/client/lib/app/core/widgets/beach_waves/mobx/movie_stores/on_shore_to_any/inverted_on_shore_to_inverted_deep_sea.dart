// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'inverted_on_shore_to_inverted_deep_sea.g.dart';

class InvertedOnShoreToInvertedDeepSea = _InvertedOnShoreToOceanInvertedDeepSeaBase
    with _$InvertedOnShoreToInvertedDeepSea;

abstract class _InvertedOnShoreToOceanInvertedDeepSeaBase
    extends BaseBeachWaveMovieStore<double> with Store {
  _InvertedOnShoreToOceanInvertedDeepSeaBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: OnShoreToAny.shouldPaintSand,
        ) {
    movie = OnShoreMovie.getMovie(
        shouldInvert: false, startingDirection: WaterDirection.up);
  }

  @override
  @action
  initMovie(double startingWaterPosition) {
    setMovie(
      OnShoreToAny.getMovie(
        startingColors: WaterColorsAndStops.invertedBeachWater,
        startingWaterMovement: startingWaterPosition,
        endingColors: WaterColorsAndStops.invertedDeepSeaWater,
      ),
    );
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }
}
