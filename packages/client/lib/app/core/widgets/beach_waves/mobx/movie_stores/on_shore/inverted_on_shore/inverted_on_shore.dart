// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'inverted_on_shore.g.dart';

class InvertedOnShore = _InvertedOnShoreBase with _$InvertedOnShore;

abstract class _InvertedOnShoreBase
    extends BaseBeachWaveMovieStore<WaterDirection> with Store {
  _InvertedOnShoreBase()
      : super(
          shouldPaintSand: OnShoreMovie.shouldPaintSand,
        ) {
    control = Control.mirror;
  }

  @action
  @override
  initMovie(params) {
    movie =
        OnShoreMovie.getMovie(shouldInvert: true, startingDirection: params);
    control = Control.mirror;
  }
}
