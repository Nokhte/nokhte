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

  late final _$muteOrUnmuteAudioAsyncAction = AsyncAction(
      '_VoiceCallActionsStoreBase.muteOrUnmuteAudio',
      context: context);

  @override
  Future<void> muteOrUnmuteAudio({required bool wantToMute}) {
    return _$muteOrUnmuteAudioAsyncAction
        .run(() => super.muteOrUnmuteAudio(wantToMute: wantToMute));
  }

  late final _$enterOrLeaveCallAsyncAction = AsyncAction(
      '_VoiceCallActionsStoreBase.enterOrLeaveCall',
      context: context);

  @override
  Future<void> enterOrLeaveCall(Either<NoParams, JoinCallParams> params) {
    return _$enterOrLeaveCallAsyncAction
        .run(() => super.enterOrLeaveCall(params));
  }

  @override
  String toString() {
    return '''
callStatus: ${callStatus}
    ''';
  }
}
