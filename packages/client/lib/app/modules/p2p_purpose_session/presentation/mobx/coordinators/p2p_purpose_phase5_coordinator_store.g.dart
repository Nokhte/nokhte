// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_purpose_phase5_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPurposePhase5CoordinatorStore
    on _P2PPurposePhase5CoordinatorStoreBase, Store {
  late final _$previousWordAtom = Atom(
      name: '_P2PPurposePhase5CoordinatorStoreBase.previousWord',
      context: context);

  @override
  String get previousWord {
    _$previousWordAtom.reportRead();
    return super.previousWord;
  }

  @override
  set previousWord(String value) {
    _$previousWordAtom.reportWrite(value, super.previousWord, () {
      super.previousWord = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_P2PPurposePhase5CoordinatorStoreBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$_P2PPurposePhase5CoordinatorStoreBaseActionController =
      ActionController(
          name: '_P2PPurposePhase5CoordinatorStoreBase', context: context);

  @override
  dynamic audioButtonHoldStartCallback() {
    final _$actionInfo =
        _$_P2PPurposePhase5CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase5CoordinatorStoreBase.audioButtonHoldStartCallback');
    try {
      return super.audioButtonHoldStartCallback();
    } finally {
      _$_P2PPurposePhase5CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic audioButtonHoldEndCallback() {
    final _$actionInfo =
        _$_P2PPurposePhase5CoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPurposePhase5CoordinatorStoreBase.audioButtonHoldEndCallback');
    try {
      return super.audioButtonHoldEndCallback();
    } finally {
      _$_P2PPurposePhase5CoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
previousWord: ${previousWord}
    ''';
  }
}
