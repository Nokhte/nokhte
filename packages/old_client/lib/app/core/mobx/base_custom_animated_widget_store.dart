// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'dart:async';

import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'base_custom_animated_widget_store.g.dart';

class BaseCustomAnimatedWidgetStore<T> = _BaseCustomAnimatedWidgetStoreBase<T>
    with _$BaseCustomAnimatedWidgetStore<T>;

abstract class _BaseCustomAnimatedWidgetStoreBase<T> extends Equatable
    with Store {
  _BaseCustomAnimatedWidgetStoreBase({this.callsOnCompleteTwice = false}) {
    controlListener();
    stopwatchListener();
  }

  final bool callsOnCompleteTwice;

  @observable
  Stopwatch localStopwatch = Stopwatch();

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
  startAndResetStopWatch() {
    localStopwatch.reset();
    localStopwatch.start();
    Timer.periodic(Seconds.get(0, milli: 1), (timer) {
      stopwatchMillseconds = localStopwatch.elapsedMilliseconds.toString();
      if (movieStatus == MovieStatus.finished) {
        timer.cancel();
      }
    });
  }

  controlListener() => reaction((p0) => control, (p0) {
        if (control == Control.playFromStart) {
          localStopwatch.start();
        } else if (control == Control.play) {
          localStopwatch.start();
        } else if (control == Control.stop) {
          localStopwatch.stop();
        }
      });

  @action
  setMovieStatus(MovieStatus newMovieStatus) => movieStatus = newMovieStatus;

  // @action
  // onCompleted() {
  //   print("did on completed run???");
  //   setMovieStatus(MovieStatus.finished);
  // }

  @action
  initMovie(T param) {}

  stopwatchListener() => reaction((p0) => stopwatchMillseconds, (p0) {
        if ((movie.duration.inMilliseconds - int.parse(p0)) < 1000) {
          if (p0 == movie.duration.inMilliseconds.toString()) {
            setMovieStatus(MovieStatus.finished);
          }
        } else if (int.parse(p0) > movie.duration.inMilliseconds) {
          localStopwatch.stop();
          localStopwatch.reset();
          setMovieStatus(MovieStatus.idle);
        }
      });

  @override
  List<Object> get props => [
// some items
      ];
}
