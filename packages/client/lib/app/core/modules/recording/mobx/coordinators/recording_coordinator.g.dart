// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecordingCoordinator on _RecordingCoordinatorBase, Store {
  late final _$recordingAtom =
      Atom(name: '_RecordingCoordinatorBase.recording', context: context);

  @override
  File get recording {
    _$recordingAtom.reportRead();
    return super.recording;
  }

  @override
  set recording(File value) {
    _$recordingAtom.reportWrite(value, super.recording, () {
      super.recording = value;
    });
  }

  late final _$isRecordingAtom =
      Atom(name: '_RecordingCoordinatorBase.isRecording', context: context);

  @override
  bool get isRecording {
    _$isRecordingAtom.reportRead();
    return super.isRecording;
  }

  @override
  set isRecording(bool value) {
    _$isRecordingAtom.reportWrite(value, super.isRecording, () {
      super.isRecording = value;
    });
  }

  late final _$startRecordingAsyncAction =
      AsyncAction('_RecordingCoordinatorBase.startRecording', context: context);

  @override
  Future startRecording(String path) {
    return _$startRecordingAsyncAction.run(() => super.startRecording(path));
  }

  late final _$stopRecordingAsyncAction =
      AsyncAction('_RecordingCoordinatorBase.stopRecording', context: context);

  @override
  Future stopRecording(NoParams params) {
    return _$stopRecordingAsyncAction.run(() => super.stopRecording(params));
  }

  @override
  String toString() {
    return '''
recording: ${recording},
isRecording: ${isRecording}
    ''';
  }
}
