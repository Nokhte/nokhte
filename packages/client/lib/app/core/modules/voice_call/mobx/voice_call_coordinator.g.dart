// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_call_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoiceCallCoordinator on _VoiceCallCoordinatorBase, Store {
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

  late final _$meetingIDAtom =
      Atom(name: '_VoiceCallCoordinatorBase.meetingID', context: context);

  @override
  String get meetingID {
    _$meetingIDAtom.reportRead();
    return super.meetingID;
  }

  @override
  set meetingID(String value) {
    _$meetingIDAtom.reportWrite(value, super.meetingID, () {
      super.meetingID = value;
    });
  }

  late final _$hasJoinedCallAtom =
      Atom(name: '_VoiceCallCoordinatorBase.hasJoinedCall', context: context);

  @override
  bool get hasJoinedCall {
    _$hasJoinedCallAtom.reportRead();
    return super.hasJoinedCall;
  }

  @override
  set hasJoinedCall(bool value) {
    _$hasJoinedCallAtom.reportWrite(value, super.hasJoinedCall, () {
      super.hasJoinedCall = value;
    });
  }

  late final _$collaboratorHasJoinedAtom = Atom(
      name: '_VoiceCallCoordinatorBase.collaboratorHasJoined',
      context: context);

  @override
  bool get collaboratorHasJoined {
    _$collaboratorHasJoinedAtom.reportRead();
    return super.collaboratorHasJoined;
  }

  @override
  set collaboratorHasJoined(bool value) {
    _$collaboratorHasJoinedAtom.reportWrite(value, super.collaboratorHasJoined,
        () {
      super.collaboratorHasJoined = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_VoiceCallCoordinatorBase.futureStore', context: context);

  @override
  BaseFutureStore<RoomInformationEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<RoomInformationEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$joinCallAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.joinCall', context: context);

  @override
  Future joinCall() {
    return _$joinCallAsyncAction.run(() => super.joinCall());
  }

  late final _$muteAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.mute', context: context);

  @override
  Future mute() {
    return _$muteAsyncAction.run(() => super.mute());
  }

  late final _$unmuteAsyncAction =
      AsyncAction('_VoiceCallCoordinatorBase.unmute', context: context);

  @override
  Future unmute() {
    return _$unmuteAsyncAction.run(() => super.unmute());
  }

  late final _$getRoomInformationAsyncAction = AsyncAction(
      '_VoiceCallCoordinatorBase.getRoomInformation',
      context: context);

  @override
  Future<void> getRoomInformation(dynamic params) {
    return _$getRoomInformationAsyncAction
        .run(() => super.getRoomInformation(params));
  }

  late final _$_VoiceCallCoordinatorBaseActionController =
      ActionController(name: '_VoiceCallCoordinatorBase', context: context);

  @override
  dynamic leaveCall() {
    final _$actionInfo = _$_VoiceCallCoordinatorBaseActionController
        .startAction(name: '_VoiceCallCoordinatorBase.leaveCall');
    try {
      return super.leaveCall();
    } finally {
      _$_VoiceCallCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
token: ${token},
meetingID: ${meetingID},
hasJoinedCall: ${hasJoinedCall},
collaboratorHasJoined: ${collaboratorHasJoined},
futureStore: ${futureStore}
    ''';
  }
}
