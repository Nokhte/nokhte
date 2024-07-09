// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'inverted_on_shore_to_inverted_deeper_blue.g.dart';

class InvertedOnShoreToInvertedDeeperBlue = _InvertedOnShoreToOceanInvertedDeeperBlueBase
    with _$InvertedOnShoreToInvertedDeeperBlue;

abstract class _InvertedOnShoreToOceanInvertedDeeperBlueBase
    extends BaseBeachWaveMovieStore<double> with Store {
  _InvertedOnShoreToOceanInvertedDeeperBlueBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: OnShoreToAny.shouldPaintSand,
        ) {
    movie = OnShoreToAny.getMovie(
      startingColors: WaterColorsAndStops.invertedBeachWater,
      startingWaterMovement: -10.0,
      endingColors: WaterColorsAndStops.invertedDeeperBlue,
    );
  }

  @override
  @action
  initMovie(double startingWaterPosition) {
    setMovie(
      OnShoreToAny.getMovie(
        startingColors: WaterColorsAndStops.invertedBeachWater,
        startingWaterMovement: startingWaterPosition,
        endingColors: WaterColorsAndStops.invertedDeeperBlue,
      ),
    );
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }

  @override
  @action
  reverseMovie(double startingWaterPosition) {
    callsOnCompleteTwice = false;
    setMovie(
      OnShoreToAny.getMovie(
        startingColors: WaterColorsAndStops.invertedBeachWater,
        startingWaterMovement: startingWaterPosition,
        endingColors: WaterColorsAndStops.invertedDeeperBlue,
      ),
    );
    setControl(Control.playReverseFromEnd);
    setMovieStatus(MovieStatus.inProgress);
  }
}
