// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
import 'times_up_movie.dart';
part 'times_up_movie_store.g.dart';

class TimesUpMovieStore = _TimesUpMovieStoreBase with _$TimesUpMovieStore;

abstract class _TimesUpMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<Duration> with Store {
  _TimesUpMovieStoreBase() {
    movie = TimesUpMovie.getMovie(
      timerLength: Seconds.get(45),
    );
  }

  @override
  initMovie(Duration param) {
    movie = TimesUpMovie.getMovie(
      timerLength: param,
    );
    control = Control.playFromStart;
  }
}
