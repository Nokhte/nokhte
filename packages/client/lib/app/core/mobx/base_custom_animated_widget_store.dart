// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'base_custom_animated_widget_store.g.dart';

class BaseCustomAnimatedWidgetStore = _BaseCustomAnimatedWidgetStoreBase
    with _$BaseCustomAnimatedWidgetStore;

abstract class _BaseCustomAnimatedWidgetStoreBase extends Equatable with Store {
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
  setMovieStatus(MovieStatus newMovieStatus) => movieStatus = newMovieStatus;

  @override
  List<Object> get props => [];
}
