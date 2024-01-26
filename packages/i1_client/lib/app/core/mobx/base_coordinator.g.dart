// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCoordinator on _BaseCoordinatorBase, Store {
  late final _$appStateAtom =
      Atom(name: '_BaseCoordinatorBase.appState', context: context);

  @override
  AppLifecycleState get appState {
    _$appStateAtom.reportRead();
    return super.appState;
  }

  @override
  set appState(AppLifecycleState value) {
    _$appStateAtom.reportWrite(value, super.appState, () {
      super.appState = value;
    });
  }

  late final _$_BaseCoordinatorBaseActionController =
      ActionController(name: '_BaseCoordinatorBase', context: context);

  @override
  dynamic setAppState(AppLifecycleState newState) {
    final _$actionInfo = _$_BaseCoordinatorBaseActionController.startAction(
        name: '_BaseCoordinatorBase.setAppState');
    try {
      return super.setAppState(newState);
    } finally {
      _$_BaseCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appState: ${appState}
    ''';
  }
}
