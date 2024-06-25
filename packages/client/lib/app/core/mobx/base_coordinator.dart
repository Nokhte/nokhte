import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';

mixin BaseCoordinator on Store {
  CaptureScreen get captureScreen;

  @observable
  bool isInErrorMode = false;

  @action
  setIsInErrorMode(bool p0) => isInErrorMode = p0;

  @observable
  bool disableAllTouchFeedback = false;

  @action
  toggleDisableAllTouchFeedback() =>
      disableAllTouchFeedback = !disableAllTouchFeedback;

  @action
  setDisableAllTouchFeedback(bool newValue) =>
      disableAllTouchFeedback = newValue;

  ifTouchIsNotDisabled(Function callback) async {
    if (!disableAllTouchFeedback) await callback();
  }

  @action
  onAppLifeCycleStateChange(
    p0, {
    required Function onResumed,
    required Function onInactive,
    Function? onDetached,
  }) {
    switch (p0) {
      case AppLifecycleState.resumed:
        onResumed();
      case AppLifecycleState.inactive:
        onInactive();
      case AppLifecycleState.detached:
        onDetached?.call();
      default:
        break;
    }
  }
}
