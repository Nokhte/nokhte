// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'base_widgets_coordinator.g.dart';

class BaseWidgetsCoordinator = _BaseWidgetsCoordinatorBase
    with _$BaseWidgetsCoordinator;

abstract class _BaseWidgetsCoordinatorBase extends Equatable with Store {
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _BaseWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
  });

  @observable
  Offset center = Offset.zero;

  @observable
  bool isDisconnected = false;

  @observable
  double smartTextTopPaddingScalar = 0;

  @observable
  double smartTextBottomPaddingScalar = .2;

  @observable
  double smartTextSubMessagePaddingScalar = 110;

  @observable
  bool touchIsDisabled = false;

  @action
  setIsDisconnected(bool newValue) => isDisconnected = newValue;

  @action
  setTouchIsDisabled(bool value) => touchIsDisabled = value;

  @action
  setSmartTextTopPaddingScalar(double value) =>
      smartTextTopPaddingScalar = value;

  @action
  setSmartTextBottomPaddingScalar(double value) =>
      smartTextBottomPaddingScalar = value;

  @action
  setSmartTextSubMessagePaddingScalar(double value) =>
      smartTextSubMessagePaddingScalar = value;

  @action
  void setSmartTextPadding({
    double? topPadding,
    double? bottomPadding,
    double? subMessagePadding,
  }) =>
      Timer(Seconds.get(1, milli: 500), () {
        if (topPadding != null) {
          setSmartTextTopPaddingScalar(topPadding);
        }
        if (bottomPadding != null) {
          setSmartTextBottomPaddingScalar(bottomPadding);
        }
        if (subMessagePadding != null) {
          setSmartTextSubMessagePaddingScalar(subMessagePadding);
        }
        setTouchIsDisabled(false);
      });

  @override
  List<Object> get props => [];
}
