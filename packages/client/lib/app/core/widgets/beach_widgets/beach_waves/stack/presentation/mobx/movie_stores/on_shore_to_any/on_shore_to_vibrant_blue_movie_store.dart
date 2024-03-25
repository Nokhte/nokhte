// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'on_shore_to_vibrant_blue_movie_store.g.dart';

class OnShoreToVibrantBlueMovieStore = _OnShoreToVibrantBlueMovieStoreBase
    with _$OnShoreToVibrantBlueMovieStore;

abstract class _OnShoreToVibrantBlueMovieStoreBase
    extends BaseBeachWaveMovieStore<double> with Store {
  _OnShoreToVibrantBlueMovieStoreBase()
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
      endingColors: WaterColorsAndStops.vibrantBlueGrad,
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
        endingColors: WaterColorsAndStops.vibrantBlueGrad,
      ),
    );
    setControl(Control.playReverseFromEnd);
    setMovieStatus(MovieStatus.inProgress);
  }
}
