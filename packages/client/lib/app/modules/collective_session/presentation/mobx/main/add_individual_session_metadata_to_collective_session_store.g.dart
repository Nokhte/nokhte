// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_individual_session_metadata_to_collective_session_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddIndividualSessionMetadataToCollectiveSessionStore
    on _AddIndividualSessionMetadataToCollectiveSessionStoreBase, Store {
  late final _$isAddedAtom = Atom(
      name: '_AddIndividualSessionMetadataToCollectiveSessionStoreBase.isAdded',
      context: context);

  @override
  bool get isAdded {
    _$isAddedAtom.reportRead();
    return super.isAdded;
  }

  @override
  set isAdded(bool value) {
    _$isAddedAtom.reportWrite(value, super.isAdded, () {
      super.isAdded = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name:
          '_AddIndividualSessionMetadataToCollectiveSessionStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<InvidualMetadataAdditionToCollectiveSessionStatusEntity>
      get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<InvidualMetadataAdditionToCollectiveSessionStatusEntity>
          value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_AddIndividualSessionMetadataToCollectiveSessionStoreBase.call',
      context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isAdded: ${isAdded},
futureStore: ${futureStore}
    ''';
  }
}
