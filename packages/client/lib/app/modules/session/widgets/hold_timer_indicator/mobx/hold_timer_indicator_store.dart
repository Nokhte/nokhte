// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
import 'package:simple_animations/simple_animations.dart';
part 'hold_timer_indicator_store.g.dart';

class HoldTimerIndicatorStore = _HoldTimerIndicatorStoreBase
    with _$HoldTimerIndicatorStore;

abstract class _HoldTimerIndicatorStoreBase
    extends BaseWidgetStore<GesturePlacement> with Store {
  _HoldTimerIndicatorStoreBase() {
    setMovie(ArcToCircleMovie.movie);
  }

  @computed
  List<ColorAndStop> get gradient => holdPosition == GesturePlacement.topHalf
      ? const [
          ColorAndStop(Colors.white, 0),
          ColorAndStop(Colors.white, 0),
        ]
      : const [
          ColorAndStop(Color(0xFF6AEAB9), 0),
          ColorAndStop(Color(0xFF43D3F5), 1),
        ];

  @observable
  GesturePlacement holdPosition = GesturePlacement.topHalf;

  @override
  @action
  initMovie(GesturePlacement holdPosition) {
    setWidgetVisibility(true);
    this.holdPosition = holdPosition;
    setControl(Control.playFromStart);
  }

  @action
  onLetGo() {
    setWidgetVisibility(false);
    setControl(Control.stop);
  }
}
