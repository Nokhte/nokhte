// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_call_status_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoiceCallStatusStore on _VoiceCallStatusStoreBase, Store {
  late final _$inCallAtom =
      Atom(name: '_VoiceCallStatusStoreBase.inCall', context: context);

  @override
  CallStatus get inCall {
    _$inCallAtom.reportRead();
    return super.inCall;
  }

  @override
  set inCall(CallStatus value) {
    _$inCallAtom.reportWrite(value, super.inCall, () {
      super.inCall = value;
    });
  }

  late final _$hasCollaboratorJoinedAtom = Atom(
      name: '_VoiceCallStatusStoreBase.hasCollaboratorJoined',
      context: context);

  @override
  bool get hasCollaboratorJoined {
    _$hasCollaboratorJoinedAtom.reportRead();
    return super.hasCollaboratorJoined;
  }

  @override
  set hasCollaboratorJoined(bool value) {
    _$hasCollaboratorJoinedAtom.reportWrite(value, super.hasCollaboratorJoined,
        () {
      super.hasCollaboratorJoined = value;
    });
  }

  late final _$_VoiceCallStatusStoreBaseActionController =
      ActionController(name: '_VoiceCallStatusStoreBase', context: context);

  @override
  dynamic registerCallbacks(RtcEngine agoraEngine) {
    final _$actionInfo = _$_VoiceCallStatusStoreBaseActionController
        .startAction(name: '_VoiceCallStatusStoreBase.registerCallbacks');
    try {
      return super.registerCallbacks(agoraEngine);
    } finally {
      _$_VoiceCallStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCallJoined() {
    final _$actionInfo = _$_VoiceCallStatusStoreBaseActionController
        .startAction(name: '_VoiceCallStatusStoreBase.onCallJoined');
    try {
      return super.onCallJoined();
    } finally {
      _$_VoiceCallStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic collaboratorHasJoined() {
    final _$actionInfo = _$_VoiceCallStatusStoreBaseActionController
        .startAction(name: '_VoiceCallStatusStoreBase.collaboratorHasJoined');
    try {
      return super.collaboratorHasJoined();
    } finally {
      _$_VoiceCallStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic collaboratorHasLeft() {
    final _$actionInfo = _$_VoiceCallStatusStoreBaseActionController
        .startAction(name: '_VoiceCallStatusStoreBase.collaboratorHasLeft');
    try {
      return super.collaboratorHasLeft();
    } finally {
      _$_VoiceCallStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCallLeft() {
    final _$actionInfo = _$_VoiceCallStatusStoreBaseActionController
        .startAction(name: '_VoiceCallStatusStoreBase.onCallLeft');
    try {
      return super.onCallLeft();
    } finally {
      _$_VoiceCallStatusStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inCall: ${inCall},
hasCollaboratorJoined: ${hasCollaboratorJoined}
    ''';
  }
}
