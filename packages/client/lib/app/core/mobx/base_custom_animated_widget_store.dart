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
  bool showWidget = true;

  @observable
  MovieStatus movieStatus = MovieStatus.idle;

  @observable
  String stopwatchMillseconds = "";

  @action
  toggleWidgetVisibility() => showWidget = !showWidget;

  @action
  void setMovie(MovieTween newMovie) => movie = newMovie;

  @action
  void setControl(Control newControl) => control = newControl;

  @action
  onCompleted() => setMovieStatus(MovieStatus.finished);

  @action
  @action
  setMovieStatus(MovieStatus newMovieStatus) => movieStatus = newMovieStatus;

  @action
  initMovie(T param) {}

  @override
  List<Object> get props => [];
}
