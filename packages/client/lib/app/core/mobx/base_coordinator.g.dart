// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseCoordinator on _BaseCoordinatorBase, Store {
  late final _$disableAllTouchFeedbackAtom = Atom(
      name: '_BaseCoordinatorBase.disableAllTouchFeedback', context: context);

  @override
  bool get disableAllTouchFeedback {
    _$disableAllTouchFeedbackAtom.reportRead();
    return super.disableAllTouchFeedback;
  }

  @override
  set disableAllTouchFeedback(bool value) {
    _$disableAllTouchFeedbackAtom
        .reportWrite(value, super.disableAllTouchFeedback, () {
      super.disableAllTouchFeedback = value;
    });
  }

  late final _$_BaseCoordinatorBaseActionController =
      ActionController(name: '_BaseCoordinatorBase', context: context);

  @override
  dynamic toggleDisableAllTouchFeedback() {
    final _$actionInfo = _$_BaseCoordinatorBaseActionController.startAction(
        name: '_BaseCoordinatorBase.toggleDisableAllTouchFeedback');
    try {
      return super.toggleDisableAllTouchFeedback();
    } finally {
      _$_BaseCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
disableAllTouchFeedback: ${disableAllTouchFeedback}
    ''';
  }
}
