// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_collaborator_perspectives_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetCollaboratorPerspectivesStore
    on _GetCollaboratorPerspectivesStoreBase, Store {
  late final _$collaboratorPerspectivesAtom = Atom(
      name: '_GetCollaboratorPerspectivesStoreBase.collaboratorPerspectives',
      context: context);

  @override
  CollaboratorPerspectivesEntity get collaboratorPerspectives {
    _$collaboratorPerspectivesAtom.reportRead();
    return super.collaboratorPerspectives;
  }

  @override
  set collaboratorPerspectives(CollaboratorPerspectivesEntity value) {
    _$collaboratorPerspectivesAtom
        .reportWrite(value, super.collaboratorPerspectives, () {
      super.collaboratorPerspectives = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_GetCollaboratorPerspectivesStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<CollaboratorPerspectivesEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollaboratorPerspectivesEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_GetCollaboratorPerspectivesStoreBase.call',
      context: context);

  @override
  Future<void> call(CollectiveSessionAudioExtrapolationInfo params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
collaboratorPerspectives: ${collaboratorPerspectives},
futureStore: ${futureStore}
    ''';
  }
}
