// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_phase_zero_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPhaseZeroWidgetsCoordinator
    on _PurposeSessionPhaseZeroWidgetsCoordinatorBase, Store {
  late final _$isConnectedAtom = Atom(
      name: '_PurposeSessionPhaseZeroWidgetsCoordinatorBase.isConnected',
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

  late final _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController =
      ActionController(
          name: '_PurposeSessionPhaseZeroWidgetsCoordinatorBase',
          context: context);

  @override
  dynamic setIsConnected(bool newVal) {
    final _$actionInfo =
        _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhaseZeroWidgetsCoordinatorBase.setIsConnected');
    try {
      return super.setIsConnected(newVal);
    } finally {
      _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInactive() {
    final _$actionInfo =
        _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhaseZeroWidgetsCoordinatorBase.onInactive');
    try {
      return super.onInactive();
    } finally {
      _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onResumed() {
    final _$actionInfo =
        _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhaseZeroWidgetsCoordinatorBase.onResumed');
    try {
      return super.onResumed();
    } finally {
      _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic constructor() {
    final _$actionInfo =
        _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
            .startAction(
                name:
                    '_PurposeSessionPhaseZeroWidgetsCoordinatorBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_PurposeSessionPhaseZeroWidgetsCoordinatorBaseActionController
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
