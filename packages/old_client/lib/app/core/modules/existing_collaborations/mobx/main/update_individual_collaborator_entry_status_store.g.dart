// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_individual_collaborator_entry_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateIndividualCollaboratorEntryStatusStore
    on _UpdateIndividualCollaboratorEntryStatusStoreBase, Store {
  late final _$hasEnteredAtom = Atom(
      name: '_UpdateIndividualCollaboratorEntryStatusStoreBase.hasEntered',
      context: context);

  @override
  bool get hasEntered {
    _$hasEnteredAtom.reportRead();
    return super.hasEntered;
  }

  @override
  set hasEntered(bool value) {
    _$hasEnteredAtom.reportWrite(value, super.hasEntered, () {
      super.hasEntered = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_UpdateIndividualCollaboratorEntryStatusStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<IndividualCollaboratorEntryStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<IndividualCollaboratorEntryStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_UpdateIndividualCollaboratorEntryStatusStoreBase.call',
      context: context);

  @override
  Future<void> call(bool params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
hasEntered: ${hasEntered},
futureStore: ${futureStore}
    ''';
  }
}
