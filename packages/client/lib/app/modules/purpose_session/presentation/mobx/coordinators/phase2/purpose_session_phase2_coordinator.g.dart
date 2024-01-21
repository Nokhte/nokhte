// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purpose_session_phase2_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurposeSessionPhase2Coordinator
    on _PurposeSessionPhase2CoordinatorBase, Store {
  late final _$canSwipeUpAtom = Atom(
      name: '_PurposeSessionPhase2CoordinatorBase.canSwipeUp',
      context: context);

  @override
  bool get canSwipeUp {
    _$canSwipeUpAtom.reportRead();
    return super.canSwipeUp;
  }

  @override
  set canSwipeUp(bool value) {
    _$canSwipeUpAtom.reportWrite(value, super.canSwipeUp, () {
      super.canSwipeUp = value;
    });
  }

  late final _$hasSwipedUpAtom = Atom(
      name: '_PurposeSessionPhase2CoordinatorBase.hasSwipedUp',
      context: context);

  @override
  bool get hasSwipedUp {
    _$hasSwipedUpAtom.reportRead();
    return super.hasSwipedUp;
  }

  @override
  set hasSwipedUp(bool value) {
    _$hasSwipedUpAtom.reportWrite(value, super.hasSwipedUp, () {
      super.hasSwipedUp = value;
    });
  }

  late final _$constructorAsyncAction = AsyncAction(
      '_PurposeSessionPhase2CoordinatorBase.constructor',
      context: context);

  @override
  Future constructor() {
    return _$constructorAsyncAction.run(() => super.constructor());
  }

  late final _$_PurposeSessionPhase2CoordinatorBaseActionController =
      ActionController(
          name: '_PurposeSessionPhase2CoordinatorBase', context: context);

  @override
  dynamic onKeyboardUp() {
    final _$actionInfo = _$_PurposeSessionPhase2CoordinatorBaseActionController
        .startAction(name: '_PurposeSessionPhase2CoordinatorBase.onKeyboardUp');
    try {
      return super.onKeyboardUp();
    } finally {
      _$_PurposeSessionPhase2CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic onKeyboardDown() {
    final _$actionInfo =
        _$_PurposeSessionPhase2CoordinatorBaseActionController.startAction(
            name: '_PurposeSessionPhase2CoordinatorBase.onKeyboardDown');
    try {
      return super.onKeyboardDown();
    } finally {
      _$_PurposeSessionPhase2CoordinatorBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
canSwipeUp: ${canSwipeUp},
hasSwipedUp: ${hasSwipedUp}
    ''';
  }
}
