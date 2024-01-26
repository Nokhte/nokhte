// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collaboration_activation_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateCollaborationActivationStatusStore
    on _UpdateCollaborationActivationStatusStoreBase, Store {
  late final _$isActivatedAtom = Atom(
      name: '_UpdateCollaborationActivationStatusStoreBase.isActivated',
      context: context);

  @override
  bool get isActivated {
    _$isActivatedAtom.reportRead();
    return super.isActivated;
  }

  @override
  set isActivated(bool value) {
    _$isActivatedAtom.reportWrite(value, super.isActivated, () {
      super.isActivated = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_UpdateCollaborationActivationStatusStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<CollaborationActivationStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollaborationActivationStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_UpdateCollaborationActivationStatusStoreBase.call',
      context: context);

  @override
  Future<void> call(bool params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isActivated: ${isActivated},
futureStore: ${futureStore}
    ''';
  }
}
