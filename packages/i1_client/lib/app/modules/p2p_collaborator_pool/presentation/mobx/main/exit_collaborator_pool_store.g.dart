// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit_collaborator_pool_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExitCollaboratorPoolStore on _ExitCollaboratorPoolStoreBase, Store {
  late final _$hasLeftAtom =
      Atom(name: '_ExitCollaboratorPoolStoreBase.hasLeft', context: context);

  @override
  bool get hasLeft {
    _$hasLeftAtom.reportRead();
    return super.hasLeft;
  }

  @override
  set hasLeft(bool value) {
    _$hasLeftAtom.reportWrite(value, super.hasLeft, () {
      super.hasLeft = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_ExitCollaboratorPoolStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollaboratorPoolExitStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollaboratorPoolExitStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_ExitCollaboratorPoolStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
hasLeft: ${hasLeft},
futureStore: ${futureStore}
    ''';
  }
}
