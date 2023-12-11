// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'black_out_movie_store.g.dart';

class BlackOutMovieStore = _BlackOutMovieStoreBase with _$BlackOutMovieStore;

abstract class _BlackOutMovieStoreBase extends BaseBeachWaveMovieStore<NoParams>
    with Store {
  _BlackOutMovieStoreBase()
      : super(shouldPaintSand: BlackOutMovie.shouldPaintSand) {
    movie = BlackOutMovie.movie;
  }

  @override
  @action
  initMovie(NoParams params) {
    control = Control.playFromStart;
  }
}
