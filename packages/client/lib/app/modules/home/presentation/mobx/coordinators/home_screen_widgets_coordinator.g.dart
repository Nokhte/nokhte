// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenWidgetsCoordinator
    on _HomeScreenWidgetsCoordinatorBase, Store {
  late final _$hasInitiatedBlurAtom = Atom(
      name: '_HomeScreenWidgetsCoordinatorBase.hasInitiatedBlur',
      context: context);

  @override
  bool get hasInitiatedBlur {
    _$hasInitiatedBlurAtom.reportRead();
    return super.hasInitiatedBlur;
  }

  @override
  set hasInitiatedBlur(bool value) {
    _$hasInitiatedBlurAtom.reportWrite(value, super.hasInitiatedBlur, () {
      super.hasInitiatedBlur = value;
    });
  }

  late final _$isDisconnectedAtom = Atom(
      name: '_HomeScreenWidgetsCoordinatorBase.isDisconnected',
      context: context);

  @override
  bool get isDisconnected {
    _$isDisconnectedAtom.reportRead();
    return super.isDisconnected;
  }

  @override
  set isDisconnected(bool value) {
    _$isDisconnectedAtom.reportWrite(value, super.isDisconnected, () {
      super.isDisconnected = value;
    });
  }

  late final _$_HomeScreenWidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_HomeScreenWidgetsCoordinatorBase', context: context);

  @override
  dynamic constructor() {
    final _$actionInfo = _$_HomeScreenWidgetsCoordinatorBaseActionController
        .startAction(name: '_HomeScreenWidgetsCoordinatorBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_HomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onConnected() {
    final _$actionInfo = _$_HomeScreenWidgetsCoordinatorBaseActionController
        .startAction(name: '_HomeScreenWidgetsCoordinatorBase.onConnected');
    try {
      return super.onConnected();
    } finally {
      _$_HomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDisconnected() {
    final _$actionInfo = _$_HomeScreenWidgetsCoordinatorBaseActionController
        .startAction(name: '_HomeScreenWidgetsCoordinatorBase.onDisconnected');
    try {
      return super.onDisconnected();
    } finally {
      _$_HomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleIsDisconnected() {
    final _$actionInfo =
        _$_HomeScreenWidgetsCoordinatorBaseActionController.startAction(
            name: '_HomeScreenWidgetsCoordinatorBase.toggleIsDisconnected');
    try {
      return super.toggleIsDisconnected();
    } finally {
      _$_HomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic toggleHasInitiatedBlur() {
    final _$actionInfo =
        _$_HomeScreenWidgetsCoordinatorBaseActionController.startAction(
            name: '_HomeScreenWidgetsCoordinatorBase.toggleHasInitiatedBlur');
    try {
      return super.toggleHasInitiatedBlur();
    } finally {
      _$_HomeScreenWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasInitiatedBlur: ${hasInitiatedBlur},
isDisconnected: ${isDisconnected}
    ''';
  }
}
