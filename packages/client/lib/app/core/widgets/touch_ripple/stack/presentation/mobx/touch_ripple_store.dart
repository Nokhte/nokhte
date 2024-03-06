// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'touch_ripple_store.g.dart';

class TouchRippleStore = _TouchRippleStoreBase with _$TouchRippleStore;

abstract class _TouchRippleStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  @observable
  Offset currentPosition = Offset.zero;

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
  onTap(Offset position) {
    setMovieStatus(MovieStatus.inProgress);
    currentPosition = position;
    info.add(
      TouchRippleAnimationInfo(
        position: position,
        movie: TouchRippleMovie.movie,
        control: Control.play,
      ),
    );
    setControl(Control.playFromStart);
  }
}
