// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/data/water_colors_and_stops.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'times_up_movie_store.g.dart';

class TimesUpMovieStore = _TimesUpMovieStoreBase with _$TimesUpMovieStore;

abstract class _TimesUpMovieStoreBase extends BaseBeachWaveMovieStore<Duration>
    with Store {
  _TimesUpMovieStoreBase()
      : super(
          shouldPaintSand: SequenceTransitionMovie.shouldPaintSand,
        ) {
    movie = SequenceTransitionMovie.getMovie(
      WaterColorsAndStops.timesUpSequence,
      movieLength: Seconds.get(45),
    );
  }

  @override
  initMovie(Duration param) {
    movie = SequenceTransitionMovie.getMovie(
      WaterColorsAndStops.timesUpSequence,
      movieLength: param,
    );
    control = Control.playFromStart;
  }
}
