// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'on_shore_to_ocean_dive.g.dart';

class OnShoreToOceanDive = _OnShoreToOceanDiveBase with _$OnShoreToOceanDive;

abstract class _OnShoreToOceanDiveBase extends BaseBeachWaveMovieStore<double>
    with Store {
  _OnShoreToOceanDiveBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: OnShoreToAny.shouldPaintSand,
        ) {
    movie = OnShoreMovie.movie;
  }

  @override
  @action
  initMovie(double startingWaterPosition) {
    callsOnCompleteTwice = true;
    setMovie(
      OnShoreToAny.getMovie(
        startingWaterMovement: startingWaterPosition,
        endingColors: WaterColorsAndStops.invertedOceanDiveWater,
      ),
    );
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }

  @action
  @override
  reverseMovie(params) {
    callsOnCompleteTwice = false;
    setMovie(
      OnShoreToAny.getMovie(
        startingWaterMovement: -10,
        endingColors: WaterColorsAndStops.oceanDiveWater,
      ),
    );
    setControl(Control.playReverseFromEnd);
    setMovieStatus(MovieStatus.inProgress);
  }
}
