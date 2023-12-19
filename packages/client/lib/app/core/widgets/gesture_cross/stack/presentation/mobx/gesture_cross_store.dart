// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:simple_animations/simple_animations.dart';
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  MovieTween topCircleAnimationMovie = MovieTween();

  @observable
  bool wantToFadeOut = true;

  @action
  setFadeOut(bool newFadeStatus) {
    wantToFadeOut = newFadeStatus;
  }

  @action
  setPillAnimationControl(Control newControl) {
    pillController = newControl;
  }

  @action
  setPillMovie(MovieTween newMovie) {
    movie = newMovie;
  }

  @observable
  Control pillController = Control.stop;

  @action
  onAnimationCompleted() {
    if (wantToFadeOut) showWidget = false;
  }

  @override
  List<Object> get props => [];
}
