// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'base_coordinator.g.dart';

class BaseCoordinator = _BaseCoordinatorBase with _$BaseCoordinator;

abstract class _BaseCoordinatorBase extends Equatable with Store {
  @observable
  bool disableAllTouchFeedback = false;

  @action
  toggleDisableAllTouchFeedback() =>
      disableAllTouchFeedback = !disableAllTouchFeedback;

  ifTouchIsNotDisabled(Function callback) {
    if (!disableAllTouchFeedback) callback();
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
