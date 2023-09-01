// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agora_callbacks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AgoraCallbacksStore on _AgoraCallbacksStoreBase, Store {
  late final _$inCallAtom =
      Atom(name: '_AgoraCallbacksStoreBase.inCall', context: context);

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

  late final _$_AgoraCallbacksStoreBaseActionController =
      ActionController(name: '_AgoraCallbacksStoreBase', context: context);

  @override
  dynamic onCallJoined() {
    final _$actionInfo = _$_AgoraCallbacksStoreBaseActionController.startAction(
        name: '_AgoraCallbacksStoreBase.onCallJoined');
    try {
      return super.onCallJoined();
    } finally {
      _$_AgoraCallbacksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCallLeft() {
    final _$actionInfo = _$_AgoraCallbacksStoreBaseActionController.startAction(
        name: '_AgoraCallbacksStoreBase.onCallLeft');
    try {
      return super.onCallLeft();
    } finally {
      _$_AgoraCallbacksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
inCall: ${inCall}
    ''';
  }
}
