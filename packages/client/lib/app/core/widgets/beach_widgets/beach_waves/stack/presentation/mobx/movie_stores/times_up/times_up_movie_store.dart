// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';

import 'times_up_movie.dart';
// * Mobx Codegen Inclusion
part 'times_up_movie_store.g.dart';

class TimesUpMovieStore = _TimesUpMovieStoreBase with _$TimesUpMovieStore;

abstract class _TimesUpMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _TimesUpMovieStoreBase() {
    movie = TimesUpMovie.getMovie(
      timerLength: Seconds.get(45),
    );
  }

  @override
  initMovie(NoParams param) {
    control = Control.playFromStart;
  }
}
