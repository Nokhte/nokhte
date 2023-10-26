// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/scheduling_delta/stack/stack.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'scheduling_delta_store.g.dart';

class SchedulingDeltaStore = _SchedulingDeltaStoreBase
    with _$SchedulingDeltaStore;

abstract class _SchedulingDeltaStoreBase extends Equatable with Store {
  @observable
  bool showWidget = false;

  @observable
  Control control = Control.stop;

  @observable
  MovieTween movie = SchedulingDeltaColorChange.getMovie(
    Colors.white,
    const Color(0xFF55FF19),
  );

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

  @action
  toggleWidgetVisibility() => showWidget = !showWidget;

  @override
  List<Object> get props => [];
}
