// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborator_individual_session_metadata_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaboratorIndividualSessionMetadataStore
    on _GetCollaboratorIndividualSessionMetadataStoreBase, Store {
  late final _$collaboratorMetadataAtom = Atom(
      name:
          '_GetCollaboratorIndividualSessionMetadataStoreBase.collaboratorMetadata',
      context: context);

  @override
  Map<dynamic, dynamic> get collaboratorMetadata {
    _$collaboratorMetadataAtom.reportRead();
    return super.collaboratorMetadata;
  }

  @override
  set collaboratorMetadata(Map<dynamic, dynamic> value) {
    _$collaboratorMetadataAtom.reportWrite(value, super.collaboratorMetadata,
        () {
      super.collaboratorMetadata = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_GetCollaboratorIndividualSessionMetadataStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<CollaboratorIndividualSessionMetadataEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<CollaboratorIndividualSessionMetadataEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_GetCollaboratorIndividualSessionMetadataStoreBase.call',
      context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
collaboratorMetadata: ${collaboratorMetadata},
futureStore: ${futureStore}
    ''';
  }
}
