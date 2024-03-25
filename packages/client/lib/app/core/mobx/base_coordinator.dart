// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
part 'base_coordinator.g.dart';

class BaseCoordinator = _BaseCoordinatorBase with _$BaseCoordinator;

abstract class _BaseCoordinatorBase extends BaseMobxDBStore with Store {
  final CaptureScreen captureScreen;

  _BaseCoordinatorBase({
    required this.captureScreen,
  });

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

  @override
  List<Object> get props => [];
}
