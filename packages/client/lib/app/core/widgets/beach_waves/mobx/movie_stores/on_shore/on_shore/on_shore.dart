// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
export 'on_shore_movie.dart';
part 'on_shore.g.dart';

class OnShore = _OnShoreBase with _$OnShore;

abstract class _OnShoreBase extends BaseBeachWaveMovieStore<NoParams>
    with Store {
  _OnShoreBase()
      : super(
          shouldPaintSand: OnShoreMovie.shouldPaintSand,
        ) {
    movie = OnShoreMovie.movie;
    control = Control.mirror;
  }

  @action
  @override
  initMovie(params) {
    movie = OnShoreMovie.movie;
    control = Control.mirror;
  }
}
