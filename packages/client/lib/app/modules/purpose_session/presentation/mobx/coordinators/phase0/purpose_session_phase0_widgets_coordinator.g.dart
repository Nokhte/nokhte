// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_phase0_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPhase0WidgetsCoordinator
    on _PurposeSessionPhase0WidgetsCoordinatorBase, Store {
  late final _$isConnectedAtom = Atom(
      name: '_PurposeSessionPhase0WidgetsCoordinatorBase.isConnected',
      context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_PurposeSessionPhase0WidgetsCoordinatorBase',
          context: context);

  @override
  dynamic setIsConnected(bool newVal) {
    final _$actionInfo =
        _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController.startAction(
            name: '_PurposeSessionPhase0WidgetsCoordinatorBase.setIsConnected');
    try {
      return super.setIsConnected(newVal);
    } finally {
      _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInactive() {
    final _$actionInfo =
        _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController
            .startAction(
                name: '_PurposeSessionPhase0WidgetsCoordinatorBase.onInactive');
    try {
      return super.onInactive();
    } finally {
      _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onResumed() {
    final _$actionInfo =
        _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController
            .startAction(
                name: '_PurposeSessionPhase0WidgetsCoordinatorBase.onResumed');
    try {
      return super.onResumed();
    } finally {
      _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic constructor() {
    final _$actionInfo =
        _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhase0WidgetsCoordinatorBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_PurposeSessionPhase0WidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isConnected: ${isConnected}
    ''';
  }
}