// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_commit_desire_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateCommitDesireStatusStore
    on _UpdateCommitDesireStatusStoreBase, Store {
  late final _$isUpdatedAtom = Atom(
      name: '_UpdateCommitDesireStatusStoreBase.isUpdated', context: context);

  @override
  bool get isUpdated {
    _$isUpdatedAtom.reportRead();
    return super.isUpdated;
  }

  @override
  set isUpdated(bool value) {
    _$isUpdatedAtom.reportWrite(value, super.isUpdated, () {
      super.isUpdated = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_UpdateCommitDesireStatusStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollaborativeDocUpdateCommitDesireStatusEntity>
      get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<CollaborativeDocUpdateCommitDesireStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_UpdateCommitDesireStatusStoreBase.call', context: context);

  @override
  Future<void> call(UpdateCommitDesireStatusParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isUpdated: ${isUpdated},
futureStore: ${futureStore}
    ''';
  }
}
