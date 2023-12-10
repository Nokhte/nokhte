// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/nokhte/stack/presentation/movie/set_nokhte_position_movie.dart';
import 'package:simple_animations/simple_animations.dart';
part 'nokhte_store.g.dart';

class NokhteStore = _NokhteStoreBase with _$NokhteStore;

abstract class _NokhteStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _NokhteStoreBase() {
    reset();
  }

  @action
  reset() {
    setMovie(
      SetNokhtePositionMovie.getMovie(
        Offset.zero,
        Offset.zero,
      ),
    );
    if (showWidget) {
      toggleWidgetVisibility();
    }
    setControl(Control.playFromStart);
    setControl(Control.stop);
  }

  @action
  onCompleted() => setMovieStatus(MovieStatus.finished);

  setPositionMovie(Offset touchPoint, Offset centerPoint) {
    setMovie(SetNokhtePositionMovie.getMovie(touchPoint, centerPoint));
    Future.delayed(Seconds.get(0, milli: 190), () {
      toggleWidgetVisibility();
      setControl(Control.playFromStart);
      setMovieStatus(MovieStatus.inProgress);
    });
  }
}
