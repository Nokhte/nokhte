// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'gesture_cross_store.g.dart';

class GestureCrossStore = _GestureCrossStoreBase with _$GestureCrossStore;

abstract class _GestureCrossStoreBase extends Equatable with Store {
  final CrossStore cross;
  final StrokeCrossNokhteStore strokeCrossNokhte;

  _GestureCrossStoreBase({
    required this.cross,
    required this.strokeCrossNokhte,
  });

  @observable
  int tapCount = 0;

  @action
  incrementTapCount() => tapCount++;

  @action
  fadeIn({
    Either<Function, bool> onFadeIn = const Right(false),
  }) {
    cross.setWidgetVisibility(true);
    Timer(Seconds.get(0, milli: 1), () {
      strokeCrossNokhte.setWidgetVisibility(true);
      onFadeIn.fold((l) => l(), (r) => null);
    });
  }

  @action
  transitionFromNokhteSessionToHomeScreen() {
    cross.initOutlineFadeOut();
    strokeCrossNokhte.setWidgetVisibility(false);
  }

  @action
  fadeInTheCross() {
    Timer(Seconds.get(0, milli: 1), () {
      cross.setWidgetVisibility(true);
      strokeCrossNokhte.setWidgetVisibility(true);
    });
  }

  @action
  startBlinking() => cross.setControl(Control.mirror);

  @action
  stopBlinking() => cross.setControl(Control.playReverse);

  @action
  toggleAll() {
    cross.toggleWidgetVisibility();
    strokeCrossNokhte.toggleWidgetVisibility();
  }

  @action
  fadeAllOut() {
    cross.setWidgetVisibility(false);
    strokeCrossNokhte.setWidgetVisibility(false);
    // centerCrossNokhte.setWidgetVisibility(false);
    // gradientNokhte.setWidgetVisibility(false);
  }

  @action
  fadeAllIn() {
    cross.setWidgetVisibility(true);
    strokeCrossNokhte.setWidgetVisibility(true);
    // centerCrossNokhte.setWidgetVisibility(true);
    // gradientNokhte.setWidgetVisibility(true);
  }

  @action
  setCollaborationHomeScreen() {
    // gradientNokhte.setControl(Control.mirror);
    cross.toggleWidgetVisibility();
    // centerCrossNokhte.toggleWidgetVisibility();
    Timer(Seconds.get(0, milli: 500), () {
      strokeCrossNokhte.toggleWidgetVisibility();
      // gradientNokhte.toggleWidgetVisibility();
    });
  }

  @action
  initMoveAndRegenerate(Offset endDirection) {
    // centerCrossNokhte.initMoveAndRegenerate(endDirection);
  }

  @override
  List<Object> get props => [];
}
