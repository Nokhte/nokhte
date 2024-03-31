// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/constants/constants.dart';
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
  TapPlacement get tapPlacement =>
      currentPosition.dy.isLessThan(screenHeight.half())
          ? TapPlacement.topHalf
          : TapPlacement.bottomHalf;

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
      case TapPlacement.topHalf:
        currentColor = Colors.white;
      case TapPlacement.bottomHalf:
        currentColor = NokhteSessionConstants.blue;
    }
    return currentColor;
  }

  @action
  onTap(
    Offset position, {
    bool adjustColorBasedOnPosition = false,
  }) {
    currentPosition = position;
    Color currentColor = Colors.white;
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
}
