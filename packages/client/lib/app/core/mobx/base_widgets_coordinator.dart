// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';

mixin BaseWidgetsCoordinator {
  WifiDisconnectOverlayStore get wifiDisconnectOverlay;

  final _center = Observable(Offset.zero);
  final _isDisconnected = Observable(false);
  final _touchIsDisabled = Observable(false);

  Offset get center => _center.value;
  bool get touchIsDisabled => _touchIsDisabled.value;
  bool get isDisconnected => _isDisconnected.value;

  _setCenter(Offset value) => _center.value = value;
  _setIsDisconnected(bool value) => _isDisconnected.value = value;
  _setTouchIsDisabled(bool value) => _touchIsDisabled.value = value;

  Action actionSetCenter = Action(() {});
  Action actionSetIsDisconnected = Action(() {});
  Action actionSetTouchIsDisabled = Action(() {});

  setIsDisconnected(bool value) {
    actionSetIsDisconnected([value]);
  }

  delayedEnableTouchFeedback() {
    Timer(Seconds.get(1, milli: 500), () {
      setTouchIsDisabled(false);
    });
  }

  setCenter(Offset value) {
    actionSetCenter([value]);
  }

  setTouchIsDisabled(bool value) {
    actionSetTouchIsDisabled([value]);
  }

  initBaseWidgetsCoordinatorActions() {
    actionSetCenter = Action(_setCenter);
    actionSetIsDisconnected = Action(_setIsDisconnected);
    actionSetTouchIsDisabled = Action(_setTouchIsDisabled);
  }
}
