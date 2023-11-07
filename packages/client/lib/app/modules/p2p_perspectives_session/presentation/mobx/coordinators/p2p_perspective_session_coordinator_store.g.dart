// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'p2p_perspective_session_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$P2PPerspectiveSessionCoordinatorStore
    on _P2PPerspectiveSessionCoordinatorStoreBase, Store {
  late final _$isInitalDocLoadAtom = Atom(
      name: '_P2PPerspectiveSessionCoordinatorStoreBase.isInitalDocLoad',
      context: context);

  @override
  bool get isInitalDocLoad {
    _$isInitalDocLoadAtom.reportRead();
    return super.isInitalDocLoad;
  }

  @override
  set isInitalDocLoad(bool value) {
    _$isInitalDocLoadAtom.reportWrite(value, super.isInitalDocLoad, () {
      super.isInitalDocLoad = value;
    });
  }

  late final _$previousWordAtom = Atom(
      name: '_P2PPerspectiveSessionCoordinatorStoreBase.previousWord',
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
      '_P2PPerspectiveSessionCoordinatorStoreBase.screenConstructor',
      context: context);

  @override
  Future screenConstructor() {
    return _$screenConstructorAsyncAction.run(() => super.screenConstructor());
  }

  late final _$updateCommitStatusToYesAsyncAction = AsyncAction(
      '_P2PPerspectiveSessionCoordinatorStoreBase.updateCommitStatusToYes',
      context: context);

  @override
  Future updateCommitStatusToYes() {
    return _$updateCommitStatusToYesAsyncAction
        .run(() => super.updateCommitStatusToYes());
  }

  late final _$_P2PPerspectiveSessionCoordinatorStoreBaseActionController =
      ActionController(
          name: '_P2PPerspectiveSessionCoordinatorStoreBase', context: context);

  @override
  dynamic setIsInitialDocLoad(bool newBool) {
    final _$actionInfo =
        _$_P2PPerspectiveSessionCoordinatorStoreBaseActionController.startAction(
            name:
                '_P2PPerspectiveSessionCoordinatorStoreBase.setIsInitialDocLoad');
    try {
      return super.setIsInitialDocLoad(newBool);
    } finally {
      _$_P2PPerspectiveSessionCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInitalDocLoad: ${isInitalDocLoad},
previousWord: ${previousWord}
    ''';
  }
}
