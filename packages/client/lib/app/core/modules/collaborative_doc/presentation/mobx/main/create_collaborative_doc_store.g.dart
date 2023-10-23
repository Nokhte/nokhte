// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collaborative_doc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateCollaborativeDocStore on _CreateCollaborativeDocStoreBase, Store {
  late final _$isCreatedAtom = Atom(
      name: '_CreateCollaborativeDocStoreBase.isCreated', context: context);

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
      name: '_CreateCollaborativeDocStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollaborativeDocCreationStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollaborativeDocCreationStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_CreateCollaborativeDocStoreBase.call', context: context);

  @override
  Future<void> call(CreateCollaborativeDocParams params) {
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
