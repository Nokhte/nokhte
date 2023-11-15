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

  late final _$bottomCircleIsUpAtom = Atom(
      name: '_P2PPurposePhase5CoordinatorStoreBase.bottomCircleIsUp',
      context: context);

  @override
  bool get bottomCircleIsUp {
    _$bottomCircleIsUpAtom.reportRead();
    return super.bottomCircleIsUp;
  }

  @override
  set bottomCircleIsUp(bool value) {
    _$bottomCircleIsUpAtom.reportWrite(value, super.bottomCircleIsUp, () {
      super.bottomCircleIsUp = value;
    });
  }

  late final _$screenConstructorAsyncAction = AsyncAction(
      '_P2PPurposePhase5CoordinatorStoreBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$updateCommitStatusAsyncAction = AsyncAction(
      '_P2PPurposePhase5CoordinatorStoreBase.updateCommitStatus',
      context: context);

  @override
  Future updateCommitStatus() {
    return _$updateCommitStatusAsyncAction
        .run(() => super.updateCommitStatus());
  }

  @override
  String toString() {
    return '''
previousWord: ${previousWord},
bottomCircleIsUp: ${bottomCircleIsUp}
    ''';
  }
}
