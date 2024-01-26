// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_individual_perspectives_audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UploadIndividualPerspectivesAudioStore
    on _UploadIndividualPerspectivesAudioStoreBase, Store {
  late final _$isUploadedAtom = Atom(
      name: '_UploadIndividualPerspectivesAudioStoreBase.isUploaded',
      context: context);

  @override
  bool get isUploaded {
    _$isUploadedAtom.reportRead();
    return super.isUploaded;
  }

  @override
  set isUploaded(bool value) {
    _$isUploadedAtom.reportWrite(value, super.isUploaded, () {
      super.isUploaded = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_UploadIndividualPerspectivesAudioStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<IndividualPerspectivesAudioUploadStatusEntity>
      get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<IndividualPerspectivesAudioUploadStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_UploadIndividualPerspectivesAudioStoreBase.call',
      context: context);

  @override
  Future<void> call(UploadIndividualPerspectivesAudioParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isUploaded: ${isUploaded},
futureStore: ${futureStore}
    ''';
  }
}
