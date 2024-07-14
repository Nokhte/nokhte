// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'empty_the_ocean_movie.dart';
part 'empty_the_ocean.g.dart';

class EmptyTheOcean = _EmptyTheOceanBase with _$EmptyTheOcean;

abstract class _EmptyTheOceanBase extends BaseBeachWaveMovieStore<double>
    with Store {
  _EmptyTheOceanBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: AnyToShoreMovie.shouldPaintSand,
        ) {
    movie = EmptyTheOceanMovie.getMovie(
        startingWaterMovement: -500,
        waterColor: WaterColorsAndStops.invertedBeachWater);
  }
  @override
  @action
  initMovie(double params) {
    movie = EmptyTheOceanMovie.getMovie(
        startingWaterMovement: params,
        waterColor: WaterColorsAndStops.invertedBeachWater);
    control = Control.playFromStart;
  }

  @override
  @action
  reverseMovie(double params) {
    callsOnCompleteTwice = false;
    movie = EmptyTheOceanMovie.getMovie(
        startingWaterMovement: params,
        waterColor: WaterColorsAndStops.invertedBeachWater);
    control = Control.playReverseFromEnd;
  }
}
