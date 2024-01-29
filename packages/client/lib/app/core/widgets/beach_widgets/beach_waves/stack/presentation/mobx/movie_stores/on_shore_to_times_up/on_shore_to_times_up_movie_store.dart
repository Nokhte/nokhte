// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'on_shore_to_times_up_movie_store.g.dart';

class OnShoreToTimesUpMovieStore = _OnShoreToTimesUpMovieStoreBase
    with _$OnShoreToTimesUpMovieStore;

abstract class _OnShoreToTimesUpMovieStoreBase
    extends BaseBeachWaveMovieStore<double> with Store {
  _OnShoreToTimesUpMovieStoreBase()
      : super(
          callsOnCompleteTwice: true,
          shouldPaintSand: OnShoreToTimesUpMovie.shouldPaintSand,
        ) {
    movie = OnShoreMovie.movie;
  }

  @override
  @action
  initMovie(double startingWaterPosition) {
    setMovie(OnShoreToTimesUpMovie.getOceanDiveMovie(
        startingWaterMovement: startingWaterPosition));
    setControl(Control.playFromStart);
    setMovieStatus(MovieStatus.inProgress);
  }
}
