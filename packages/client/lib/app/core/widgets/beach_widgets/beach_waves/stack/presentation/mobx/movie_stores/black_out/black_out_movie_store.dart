// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import 'black_out_movie.dart';
part 'black_out_movie_store.g.dart';

class BlackOutMovieStore = _BlackOutMovieStoreBase with _$BlackOutMovieStore;

abstract class _BlackOutMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _BlackOutMovieStoreBase() {
    movie = BlackOutMovie.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
