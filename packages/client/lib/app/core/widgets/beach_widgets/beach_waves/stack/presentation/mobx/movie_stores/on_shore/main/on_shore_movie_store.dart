// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'on_shore_movie_store.g.dart';

class OnShoreMovieStore = _OnShoreMovieStoreBase with _$OnShoreMovieStore;

abstract class _OnShoreMovieStoreBase extends BaseBeachWaveMovieStore
    with Store {
  _OnShoreMovieStoreBase()
      : super(
          shouldPaintSand: OnShoreMovie.shouldPaintSand,
        ) {
    movie = OnShoreMovie.movie;
    control = Control.mirror;
  }
}
