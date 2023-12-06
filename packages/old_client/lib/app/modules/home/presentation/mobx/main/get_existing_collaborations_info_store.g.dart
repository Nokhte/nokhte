// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_existing_collaborations_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetExistingCollaborationsInfoStore
    on _GetExistingCollaborationsInfoStoreBase, Store {
  late final _$hasACollaborationAtom = Atom(
      name: '_GetExistingCollaborationsInfoStoreBase.hasACollaboration',
      context: context);

  @override
  bool get hasACollaboration {
    _$hasACollaborationAtom.reportRead();
    return super.hasACollaboration;
  }

  @override
  set hasACollaboration(bool value) {
    _$hasACollaborationAtom.reportWrite(value, super.hasACollaboration, () {
      super.hasACollaboration = value;
    });
  }

  late final _$hasDonePerspectivesAtom = Atom(
      name: '_GetExistingCollaborationsInfoStoreBase.hasDonePerspectives',
      context: context);

  @override
  bool get hasDonePerspectives {
    _$hasDonePerspectivesAtom.reportRead();
    return super.hasDonePerspectives;
  }

  @override
  set hasDonePerspectives(bool value) {
    _$hasDonePerspectivesAtom.reportWrite(value, super.hasDonePerspectives, () {
      super.hasDonePerspectives = value;
    });
  }

  late final _$hasCommittedAPurposeAtom = Atom(
      name: '_GetExistingCollaborationsInfoStoreBase.hasCommittedAPurpose',
      context: context);

  @override
  bool get hasCommittedAPurpose {
    _$hasCommittedAPurposeAtom.reportRead();
    return super.hasCommittedAPurpose;
  }

  @override
  set hasCommittedAPurpose(bool value) {
    _$hasCommittedAPurposeAtom.reportWrite(value, super.hasCommittedAPurpose,
        () {
      super.hasCommittedAPurpose = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_GetExistingCollaborationsInfoStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<ExistingCollaborationsInfoEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<ExistingCollaborationsInfoEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_GetExistingCollaborationsInfoStoreBase.call',
      context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
hasACollaboration: ${hasACollaboration},
hasDonePerspectives: ${hasDonePerspectives},
hasCommittedAPurpose: ${hasCommittedAPurpose},
futureStore: ${futureStore}
    ''';
  }
}
