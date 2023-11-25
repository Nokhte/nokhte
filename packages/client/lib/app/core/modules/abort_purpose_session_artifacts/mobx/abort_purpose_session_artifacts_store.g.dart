// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abort_purpose_session_artifacts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AbortPurposeSessionArtifactsStore
    on _AbortPurposeSessionArtifactsStoreBase, Store {
  late final _$isAbortedAtom = Atom(
      name: '_AbortPurposeSessionArtifactsStoreBase.isAborted',
      context: context);

  @override
  bool get isAborted {
    _$isAbortedAtom.reportRead();
    return super.isAborted;
  }

  @override
  set isAborted(bool value) {
    _$isAbortedAtom.reportWrite(value, super.isAborted, () {
      super.isAborted = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_AbortPurposeSessionArtifactsStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<PurposeSessionArtifactAbortionStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<PurposeSessionArtifactAbortionStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_AbortPurposeSessionArtifactsStoreBase.call',
      context: context);

  @override
  Future<void> call(AbortPurposeSessionArtifactsParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isAborted: ${isAborted},
futureStore: ${futureStore}
    ''';
  }
}
