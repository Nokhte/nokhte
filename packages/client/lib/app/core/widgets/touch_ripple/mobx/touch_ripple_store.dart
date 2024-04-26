// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/shared/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'touch_ripple_store.g.dart';

class TouchRippleStore = _TouchRippleStoreBase with _$TouchRippleStore;

abstract class _TouchRippleStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @observable
  Offset currentPosition = Offset.zero;

  @observable
  double screenHeight = -1;

  @action
  setScreenHeight(double newHeight) => screenHeight = newHeight;

  @computed
  GesturePlacement get tapPlacement =>
      currentPosition.dy.isLessThan(screenHeight.half())
          ? GesturePlacement.topHalf
          : GesturePlacement.bottomHalf;

  @observable
  ObservableList<TouchRippleAnimationInfo> info =
      ObservableList<TouchRippleAnimationInfo>();

  @override
  @action
  onCompleted() {
    super.onCompleted();
    info.clear();
  }

  @action
  adjustColor() {
    Color currentColor = Colors.white;
    switch (tapPlacement) {
      case GesturePlacement.topHalf:
        currentColor = Colors.white;
      case GesturePlacement.bottomHalf:
        currentColor = NokhteSessionConstants.blue;
    }
    return currentColor;
  }

  @action
  onTap(
    Offset position, {
    bool adjustColorBasedOnPosition = false,
    Color overridedColor = Colors.transparent,
  }) {
    currentPosition = position;
    Color currentColor = Colors.white;

    if (overridedColor != Colors.transparent) {
      currentColor = overridedColor;
    }
    if (adjustColorBasedOnPosition) {
      currentColor = adjustColor();
    }
    setMovieStatus(MovieStatus.inProgress);
    info.add(
      TouchRippleAnimationInfo(
          position: position,
          movie: TouchRippleMovie.movie,
          control: Control.play,
          rippleColor: currentColor),
    );
    setControl(Control.playFromStart);
  }

  @action
  onSwipe(Offset position) {
    currentPosition = position;
    setMovieStatus(MovieStatus.inProgress);
    info.add(
      TouchRippleAnimationInfo(
          position: position,
          movie: WaterWakeMovie.movie,
          control: Control.play,
          rippleColor: Colors.white),
    );
    setControl(Control.playFromStart);
  }
}
