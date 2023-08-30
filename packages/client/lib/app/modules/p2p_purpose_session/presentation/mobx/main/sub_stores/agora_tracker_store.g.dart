// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_tracker_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AgoraTrackerStore on _AgoraTrackerStoreBase, Store {
  late final _$inCallAtom =
      Atom(name: '_AgoraTrackerStoreBase.inCall', context: context);

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

  late final _$_AgoraTrackerStoreBaseActionController =
      ActionController(name: '_AgoraTrackerStoreBase', context: context);

  @override
  dynamic joiningCall() {
    final _$actionInfo = _$_AgoraTrackerStoreBaseActionController.startAction(
        name: '_AgoraTrackerStoreBase.joiningCall');
    try {
      return super.joiningCall();
    } finally {
      _$_AgoraTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic leavingCall() {
    final _$actionInfo = _$_AgoraTrackerStoreBaseActionController.startAction(
        name: '_AgoraTrackerStoreBase.leavingCall');
    try {
      return super.leavingCall();
    } finally {
      _$_AgoraTrackerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inCall: ${inCall}
    ''';
  }
}
