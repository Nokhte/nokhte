// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_widgets_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseWidgetsCoordinator on _BaseWidgetsCoordinatorBase, Store {
  late final _$isDisconnectedAtom = Atom(
      name: '_BaseWidgetsCoordinatorBase.isDisconnected', context: context);

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

  late final _$_BaseWidgetsCoordinatorBaseActionController =
      ActionController(name: '_BaseWidgetsCoordinatorBase', context: context);

  @override
  dynamic setIsDisconnected(bool newValue) {
    final _$actionInfo = _$_BaseWidgetsCoordinatorBaseActionController
        .startAction(name: '_BaseWidgetsCoordinatorBase.setIsDisconnected');
    try {
      return super.setIsDisconnected(newValue);
    } finally {
      _$_BaseWidgetsCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDisconnected: ${isDisconnected}
    ''';
  }
}
