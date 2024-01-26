// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'base_coordinator.g.dart';

class BaseCoordinator = _BaseCoordinatorBase with _$BaseCoordinator;

abstract class _BaseCoordinatorBase extends Equatable with Store {
  @observable
  AppLifecycleState appState = AppLifecycleState.resumed;

  foregroundAndBackgroundStateListener({
    required Function resumedCallback,
    required Function inactiveCallback,
    required Function detachedCallback,
  }) =>
      reaction((p0) => appState, (p0) async {
        switch (p0) {
          case AppLifecycleState.resumed:
            await resumedCallback();
          case AppLifecycleState.inactive:
            await inactiveCallback();
          case AppLifecycleState.detached:
            await detachedCallback();
          default:
            break;
        }
      });

  @action
  setAppState(AppLifecycleState newState) => appState = newState;

  @override
  List<Object> get props => [];
}
