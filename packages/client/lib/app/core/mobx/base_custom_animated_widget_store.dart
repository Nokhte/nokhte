// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
part 'base_custom_animated_widget_store.g.dart';

class BaseCustomAnimatedWidgetStore<T> = _BaseCustomAnimatedWidgetStoreBase<T>
    with _$BaseCustomAnimatedWidgetStore<T>;

abstract class _BaseCustomAnimatedWidgetStoreBase<T> extends Equatable
    with Store {
  _BaseCustomAnimatedWidgetStoreBase({
    this.callsOnCompleteTwice = false,
  });

  final bool callsOnCompleteTwice;

  @observable
  MovieTween movie = MovieTween();

  @observable
  Control control = Control.stop;

  @observable
  Control pastControl = Control.stop;

  @observable
  bool showWidget = true;

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @observable
  bool hasFadedIn = false;

  @observable
  int tapCount = 0;

  @action
  incrementTapCount() => tapCount++;

  @action
  toggleHasFadedIn() => hasFadedIn = !hasFadedIn;

  @action
  toggleWidgetVisibility() => showWidget = !showWidget;

  @action
  setWidgetVisibility(bool newVal) => showWidget = newVal;

  @action
  setPastControl(Control newControl) => pastControl = newControl;

  @action
  void setMovie(MovieTween newMovie) => movie = newMovie;

  @action
  void setControl(Control newControl) => control = newControl;

  @action
  onCompleted() {
    setMovieStatus(MovieStatus.finished);
    setPastControl(control);
    setControl(Control.stop);
  }

  @action
  setMovieStatus(MovieStatus newMovieStatus) => movieStatus = newMovieStatus;

  @action
  initMovie(T param) {}

  @override
  List<Object> get props => [];
}
