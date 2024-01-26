// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collective_session_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCollectiveSessionStore
    on _CreateCollectiveSessionStoreBase, Store {
  late final _$isCreatedAtom = Atom(
      name: '_CreateCollectiveSessionStoreBase.isCreated', context: context);

  @override
  bool get isCreated {
    _$isCreatedAtom.reportRead();
    return super.isCreated;
  }

  @override
  set isCreated(bool value) {
    _$isCreatedAtom.reportWrite(value, super.isCreated, () {
      super.isCreated = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_CreateCollectiveSessionStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollectiveSessionCreationStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<CollectiveSessionCreationStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_CreateCollectiveSessionStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isCreated: ${isCreated},
futureStore: ${futureStore}
    ''';
  }
}
