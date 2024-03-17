// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends Equatable with Store {
  final CrossStore cross;
  final GradientCrossNokhteStore gradientNokhte;
  final CenterCrossNokhteStore centerCrossNokhte;
  final StrokeCrossNokhteStore strokeCrossNokhte;

  _GestureCrossStoreBase({
    required this.cross,
    required this.gradientNokhte,
    required this.centerCrossNokhte,
    required this.strokeCrossNokhte,
  });

  @observable
  int tapCount = 0;

  @action
  incrementTapCount() => tapCount++;

  @action
  fadeIn({bool initOutlineFadeIn = false}) {
    cross.setWidgetVisibility(true);
    centerCrossNokhte.setWidgetVisibility(true);
    if (initOutlineFadeIn) {
      cross.initOutlineFadeIn();
    }
    Future.delayed(Seconds.get(0, milli: 1), () {
      strokeCrossNokhte.setWidgetVisibility(true);
      gradientNokhte.setWidgetVisibility(true);
    });
  }

  @action
  transitionFromNokhteSessionToHomeScreen() {
    cross.initOutlineFadeOut();
    strokeCrossNokhte.setWidgetVisibility(false);
  }

  @action
  fadeInTheCross() {
    cross.toggleWidgetVisibility();
    centerCrossNokhte.toggleWidgetVisibility();
  }

  @action
  startBlinking() => cross.setControl(Control.mirror);

  @action
  stopBlinking() => cross.setControl(Control.playReverse);

  @action
  toggleAll() {
    cross.toggleWidgetVisibility();
    strokeCrossNokhte.toggleWidgetVisibility();
    centerCrossNokhte.toggleWidgetVisibility();
    gradientNokhte.toggleWidgetVisibility();
  }

  @action
  fadeAllOut() {
    cross.setWidgetVisibility(false);
    strokeCrossNokhte.setWidgetVisibility(false);
    centerCrossNokhte.setWidgetVisibility(false);
    gradientNokhte.setWidgetVisibility(false);
  }

  @action
  fadeAllIn() {
    cross.setWidgetVisibility(true);
    strokeCrossNokhte.setWidgetVisibility(true);
    centerCrossNokhte.setWidgetVisibility(true);
    gradientNokhte.setWidgetVisibility(true);
  }

  @action
  setCollaborationHomeScreen() {
    gradientNokhte.setControl(Control.mirror);
    cross.toggleWidgetVisibility();
    centerCrossNokhte.toggleWidgetVisibility();
    Future.delayed(Seconds.get(0, milli: 500), () {
      strokeCrossNokhte.toggleWidgetVisibility();
      gradientNokhte.toggleWidgetVisibility();
    });
  }

  @action
  initMoveAndRegenerate(Offset endDirection) {
    centerCrossNokhte.initMoveAndRegenerate(endDirection);
  }

  @override
  List<Object> get props => [];
}
