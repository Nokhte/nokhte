// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_perspectives_audio_recording_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePerspectivesAudioRecordingStatusStore
    on _ChangePerspectivesAudioRecordingStatusStoreBase, Store {
  late final _$recordingStatusAtom = Atom(
      name: '_ChangePerspectivesAudioRecordingStatusStoreBase.recordingStatus',
      context: context);

  @override
  PerspectivesAudioRecordingStatus get recordingStatus {
    _$recordingStatusAtom.reportRead();
    return super.recordingStatus;
  }

  @override
  set recordingStatus(PerspectivesAudioRecordingStatus value) {
    _$recordingStatusAtom.reportWrite(value, super.recordingStatus, () {
      super.recordingStatus = value;
    });
  }

  late final _$returnFileAtom = Atom(
      name: '_ChangePerspectivesAudioRecordingStatusStoreBase.returnFile',
      context: context);

  @override
  File get returnFile {
    _$returnFileAtom.reportRead();
    return super.returnFile;
  }

  @override
  set returnFile(File value) {
    _$returnFileAtom.reportWrite(value, super.returnFile, () {
      super.returnFile = value;
    });
  }

  late final _$stateAtom = Atom(
      name: '_ChangePerspectivesAudioRecordingStatusStoreBase.state',
      context: context);

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_ChangePerspectivesAudioRecordingStatusStoreBase.call',
      context: context);

  @override
  Future<void> call(dynamic params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
recordingStatus: ${recordingStatus},
returnFile: ${returnFile},
state: ${state}
    ''';
  }
}
