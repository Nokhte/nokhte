// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_call_actions_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoiceCallActionsStore on _VoiceCallActionsStoreBase, Store {
  late final _$callStatusAtom =
      Atom(name: '_VoiceCallActionsStoreBase.callStatus', context: context);

  @override
  CallStatus get callStatus {
    _$callStatusAtom.reportRead();
    return super.callStatus;
  }

  @override
  set callStatus(CallStatus value) {
    _$callStatusAtom.reportWrite(value, super.callStatus, () {
      super.callStatus = value;
    });
  }

  late final _$isMutedAtom =
      Atom(name: '_VoiceCallActionsStoreBase.isMuted', context: context);

  @override
  bool get isMuted {
    _$isMutedAtom.reportRead();
    return super.isMuted;
  }

  @override
  set isMuted(bool value) {
    _$isMutedAtom.reportWrite(value, super.isMuted, () {
      super.isMuted = value;
    });
  }

  late final _$isRecordingAtom =
      Atom(name: '_VoiceCallActionsStoreBase.isRecording', context: context);

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

  late final _$startRecordingAsyncAction = AsyncAction(
      '_VoiceCallActionsStoreBase.startRecording',
      context: context);

  @override
  Future startRecording(dynamic fileName) {
    return _$startRecordingAsyncAction
        .run(() => super.startRecording(fileName));
  }

  late final _$stopRecordingAsyncAction =
      AsyncAction('_VoiceCallActionsStoreBase.stopRecording', context: context);

  @override
  Future stopRecording() {
    return _$stopRecordingAsyncAction.run(() => super.stopRecording());
  }

  late final _$unmuteAsyncAction =
      AsyncAction('_VoiceCallActionsStoreBase.unmute', context: context);

  @override
  Future unmute() {
    return _$unmuteAsyncAction.run(() => super.unmute());
  }

  late final _$muteAsyncAction =
      AsyncAction('_VoiceCallActionsStoreBase.mute', context: context);

  @override
  Future mute() {
    return _$muteAsyncAction.run(() => super.mute());
  }

  late final _$joinCallAsyncAction =
      AsyncAction('_VoiceCallActionsStoreBase.joinCall', context: context);

  @override
  Future joinCall(JoinCallParams params) {
    return _$joinCallAsyncAction.run(() => super.joinCall(params));
  }

  late final _$leaveCallAsyncAction =
      AsyncAction('_VoiceCallActionsStoreBase.leaveCall', context: context);

  @override
  Future leaveCall(NoParams params) {
    return _$leaveCallAsyncAction.run(() => super.leaveCall(params));
  }

  @override
  String toString() {
    return '''
callStatus: ${callStatus},
isMuted: ${isMuted},
isRecording: ${isRecording}
    ''';
  }
}
