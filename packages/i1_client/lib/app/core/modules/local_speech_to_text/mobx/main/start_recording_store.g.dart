// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_recording_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StartRecordingStore on _StartRecordingStoreBase, Store {
  late final _$recordingStatusAtom =
      Atom(name: '_StartRecordingStoreBase.recordingStatus', context: context);

  @override
  SpeechToTextRecordingStatus get recordingStatus {
    _$recordingStatusAtom.reportRead();
    return super.recordingStatus;
  }

  @override
  set recordingStatus(SpeechToTextRecordingStatus value) {
    _$recordingStatusAtom.reportWrite(value, super.recordingStatus, () {
      super.recordingStatus = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_StartRecordingStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<SpeechToTextRecordingStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<SpeechToTextRecordingStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_StartRecordingStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
recordingStatus: ${recordingStatus},
futureStore: ${futureStore}
    ''';
  }
}
