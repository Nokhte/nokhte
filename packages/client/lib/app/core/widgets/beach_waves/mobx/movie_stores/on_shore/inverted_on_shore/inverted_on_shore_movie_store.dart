// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'inverted_on_shore_movie_store.g.dart';

class InvertedOnShoreMovieStore = _InvertedOnShoreMovieStoreBase
    with _$InvertedOnShoreMovieStore;

abstract class _InvertedOnShoreMovieStoreBase
    extends BaseBeachWaveMovieStore<NoParams> with Store {
  _InvertedOnShoreMovieStoreBase()
      : super(
          shouldPaintSand: OnShoreMovie.shouldPaintSand,
        ) {
    movie = InvertedOnShoreMovie.movie;
    control = Control.playFromStart;
  }

  @action
  @override
  initMovie(params) {
    movie = InvertedOnShoreMovie.movie;
    control = Control.mirror;
  }
}
