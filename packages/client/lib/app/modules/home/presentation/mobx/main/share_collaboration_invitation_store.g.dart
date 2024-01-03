// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_collaboration_invitation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShareCollaborationInvitationStore
    on _ShareCollaborationInvitationStoreBase, Store {
  late final _$isSharedAtom = Atom(
      name: '_ShareCollaborationInvitationStoreBase.isShared',
      context: context);

  @override
  bool get isShared {
    _$isSharedAtom.reportRead();
    return super.isShared;
  }

  @override
  set isShared(bool value) {
    _$isSharedAtom.reportWrite(value, super.isShared, () {
      super.isShared = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_ShareCollaborationInvitationStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<CollaborationInvitationSendStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<CollaborationInvitationSendStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_ShareCollaborationInvitationStoreBase.call',
      context: context);

  @override
  Future<void> call(String params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isShared: ${isShared},
futureStore: ${futureStore}
    ''';
  }
}
