// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import 'black_out_to_dry_sand_movie.dart';
part 'black_out_to_dry_sand_movie_store.g.dart';

class BlackOutToDrySandMovieStore = _BlackOutToDrySandMovieStoreBase
    with _$BlackOutToDrySandMovieStore;

abstract class _BlackOutToDrySandMovieStoreBase
    extends BaseCustomAnimatedWidgetStore<NoParams> with Store {
  _BlackOutToDrySandMovieStoreBase() {
    movie = BlackOutToDrySandMovie.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
