// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voice_call_incidents_overlay_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VoiceCallIncidentsOverlayStore
    on _VoiceCallIncidentsOverlayStoreBase, Store {
  late final _$showJoiningCallAtom = Atom(
      name: '_VoiceCallIncidentsOverlayStoreBase.showJoiningCall',
      context: context);

  @override
  bool get showJoiningCall {
    _$showJoiningCallAtom.reportRead();
    return super.showJoiningCall;
  }

  @override
  set showJoiningCall(bool value) {
    _$showJoiningCallAtom.reportWrite(value, super.showJoiningCall, () {
      super.showJoiningCall = value;
    });
  }

  late final _$showWaitingOnCollaboratorAtom = Atom(
      name: '_VoiceCallIncidentsOverlayStoreBase.showWaitingOnCollaborator',
      context: context);

  @override
  bool get showWaitingOnCollaborator {
    _$showWaitingOnCollaboratorAtom.reportRead();
    return super.showWaitingOnCollaborator;
  }

  @override
  set showWaitingOnCollaborator(bool value) {
    _$showWaitingOnCollaboratorAtom
        .reportWrite(value, super.showWaitingOnCollaborator, () {
      super.showWaitingOnCollaborator = value;
    });
  }

  late final _$_VoiceCallIncidentsOverlayStoreBaseActionController =
      ActionController(
          name: '_VoiceCallIncidentsOverlayStoreBase', context: context);

  @override
  dynamic setShowJoiningCall(bool newVal) {
    final _$actionInfo =
        _$_VoiceCallIncidentsOverlayStoreBaseActionController.startAction(
            name: '_VoiceCallIncidentsOverlayStoreBase.setShowJoiningCall');
    try {
      return super.setShowJoiningCall(newVal);
    } finally {
      _$_VoiceCallIncidentsOverlayStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setShowWaitingOnCollaborator(bool newVal) {
    final _$actionInfo =
        _$_VoiceCallIncidentsOverlayStoreBaseActionController.startAction(
            name:
                '_VoiceCallIncidentsOverlayStoreBase.setShowWaitingOnCollaborator');
    try {
      return super.setShowWaitingOnCollaborator(newVal);
    } finally {
      _$_VoiceCallIncidentsOverlayStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic constructor() {
    final _$actionInfo = _$_VoiceCallIncidentsOverlayStoreBaseActionController
        .startAction(name: '_VoiceCallIncidentsOverlayStoreBase.constructor');
    try {
      return super.constructor();
    } finally {
      _$_VoiceCallIncidentsOverlayStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showJoiningCall: ${showJoiningCall},
showWaitingOnCollaborator: ${showWaitingOnCollaborator}
    ''';
  }
}
