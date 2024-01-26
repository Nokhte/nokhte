// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:simple_animations/simple_animations.dart';
part 'scheduling_delta_store.g.dart';

class SchedulingDeltaStore = _SchedulingDeltaStoreBase
    with _$SchedulingDeltaStore;

abstract class _SchedulingDeltaStoreBase extends BaseCustomAnimatedWidgetStore
    with Store {
  _SchedulingDeltaStoreBase() {
    showWidget = false;
    control = Control.stop;
    movie = SchedulingDeltaColorChange.getMovie(
      Colors.white,
      const Color(0xFF55FF19),
    );
  }

  @action
  resetColorTransition() {
    control = Control.playFromStart;
    control = Control.stop;
  }

  @action
  startColorTransitionMovie() {
    control = Control.playFromStart;
  }

  @action
  backTrackTheTransition() {
    control = Control.playReverse;
  }

  @override
  List<Object> get props => [];
}
