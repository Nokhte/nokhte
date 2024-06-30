// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
part 'base_coordinator.g.dart';

class BaseCoordinator<P, T> = _BaseCoordinatorBase<P, T>
    with _$BaseCoordinator<P, T>;

abstract class _BaseCoordinatorBase<P, T> with Store {
  final CaptureScreen captureScreen;

  _BaseCoordinatorBase({
    required this.captureScreen,
  });

  List<ReactionDisposer> disposers = [];

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

  deconstructor() {
    for (var disposer in disposers) {
      disposer.call();
    }
  }
}
