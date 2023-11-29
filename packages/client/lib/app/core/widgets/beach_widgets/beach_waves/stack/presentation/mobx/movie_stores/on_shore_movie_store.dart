// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'on_shore_movie_store.g.dart';

class OnShoreMovieStore = _OnShoreMovieStoreBase with _$OnShoreMovieStore;

abstract class _OnShoreMovieStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _OnShoreMovieStoreBase() {
    movie = OnShore.movie;
    control = Control.mirror;
  }

  @observable
  double currentWaterYPosition = -1.0;

  @action
  setCurrentWaterYPosition(double newYWaterPosition) =>
      currentWaterYPosition = newYWaterPosition;
}
