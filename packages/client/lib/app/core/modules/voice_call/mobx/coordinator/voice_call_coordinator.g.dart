// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_call_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoiceCallCoordinator on _VoiceCallCoordinatorBase, Store {
  late final _$isInitializedAtom =
      Atom(name: '_VoiceCallCoordinatorBase.isInitialized', context: context);

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  late final _$channelIdAtom =
      Atom(name: '_VoiceCallCoordinatorBase.channelId', context: context);

  @override
  String get channelId {
    _$channelIdAtom.reportRead();
    return super.channelId;
  }

  @override
  set channelId(String value) {
    _$channelIdAtom.reportWrite(value, super.channelId, () {
      super.channelId = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: '_VoiceCallCoordinatorBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$rtcEngineAtom =
      Atom(name: '_VoiceCallCoordinatorBase.rtcEngine', context: context);

  @override
  RtcEngine get rtcEngine {
    _$rtcEngineAtom.reportRead();
    return super.rtcEngine;
  }

  @override
  set rtcEngine(RtcEngine value) {
    _$rtcEngineAtom.reportWrite(value, super.rtcEngine, () {
      super.rtcEngine = value;
    });
  }

  late final _$initSdkAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.initSdk', context: context);

  @override
  Future initSdk() {
    return _$initSdkAsyncAction.run(() => super.initSdk());
  }

  late final _$_getChannelIdAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase._getChannelId', context: context);

  @override
  Future _getChannelId() {
    return _$_getChannelIdAsyncAction.run(() => super._getChannelId());
  }

  late final _$_getTokenAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase._getToken', context: context);

  @override
  Future _getToken() {
    return _$_getTokenAsyncAction.run(() => super._getToken());
  }

  late final _$joinCallAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.joinCall', context: context);

  @override
  Future joinCall({required bool shouldEnterTheCallMuted}) {
    return _$joinCallAsyncAction.run(
        () => super.joinCall(shouldEnterTheCallMuted: shouldEnterTheCallMuted));
  }

  late final _$unmuteAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.unmute', context: context);

  @override
  Future unmute() {
    return _$unmuteAsyncAction.run(() => super.unmute());
  }

  late final _$muteAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.mute', context: context);

  @override
  Future mute() {
    return _$muteAsyncAction.run(() => super.mute());
  }

  late final _$leaveCallAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.leaveCall', context: context);

  @override
  Future leaveCall() {
    return _$leaveCallAsyncAction.run(() => super.leaveCall());
  }

  @override
  String toString() {
    return '''
isInitialized: ${isInitialized},
channelId: ${channelId},
token: ${token},
rtcEngine: ${rtcEngine}
    ''';
  }
}
