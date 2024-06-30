// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'base_widgets_coordinator.g.dart';

class BaseWidgetsCoordinator = _BaseWidgetsCoordinatorBase
    with _$BaseWidgetsCoordinator;

abstract class _BaseWidgetsCoordinatorBase with Store {
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _BaseWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
  });

  List<ReactionDisposer> disposers = [];

  @observable
  Offset center = Offset.zero;

  @observable
  bool isDisconnected = false;

  @observable
  bool touchIsDisabled = false;

  @action
  setIsDisconnected(bool newValue) => isDisconnected = newValue;

  @action
  setTouchIsDisabled(bool value) => touchIsDisabled = value;

  deconstructor() {
    for (var disposer in disposers) {
      disposer.call();
    }
  }
}
