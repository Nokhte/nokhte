// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_collaborators_perspectives_clips_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DownloadCollaboratorsPerspectivesClipsStore
    on _DownloadCollaboratorsPerspectivesClipsStoreBase, Store {
  late final _$isDownloadedAtom = Atom(
      name: '_DownloadCollaboratorsPerspectivesClipsStoreBase.isDownloaded',
      context: context);

  @override
  bool get isDownloaded {
    _$isDownloadedAtom.reportRead();
    return super.isDownloaded;
  }

  @override
  set isDownloaded(bool value) {
    _$isDownloadedAtom.reportWrite(value, super.isDownloaded, () {
      super.isDownloaded = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_DownloadCollaboratorsPerspectivesClipsStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<CollaboratorsAudioClipsDownloadStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<CollaboratorsAudioClipsDownloadStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_DownloadCollaboratorsPerspectivesClipsStoreBase.call',
      context: context);

  @override
  Future<void> call(CollectiveSessionAudioExtrapolationInfo params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isDownloaded: ${isDownloaded},
futureStore: ${futureStore}
    ''';
  }
}
