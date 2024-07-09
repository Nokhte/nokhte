// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'on_shore_to_sky.g.dart';

class OnShoreToSky = _OnShoreToSkyBase with _$OnShoreToSky;

abstract class _OnShoreToSkyBase extends BaseBeachWaveMovieStore<double>
    with Store {
  _OnShoreToSkyBase()
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
    setMovie(OnShoreToAny.getMovie(
      startingWaterMovement: startingWaterPosition,
      endingColors: WaterColorsAndStops.sky,
    ));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }

  @override
  @action
  reverseMovie(params) {
    callsOnCompleteTwice = false;
    setMovie(
      OnShoreToAny.getMovie(
        startingWaterMovement: -10.0,
        endingColors: WaterColorsAndStops.sky,
      ),
    );
    setControl(Control.playReverseFromEnd);
    setMovieStatus(MovieStatus.inProgress);
  }
}
