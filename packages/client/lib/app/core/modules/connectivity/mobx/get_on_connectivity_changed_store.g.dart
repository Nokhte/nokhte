// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_on_connectivity_changed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetOnConnectivityChangedStore
    on _GetOnConnectivityChangedStoreBase, Store {
  late final _$connectivityStreamAtom = Atom(
      name: '_GetOnConnectivityChangedStoreBase.connectivityStream',
      context: context);

  @override
  ObservableStream<ConnectivityResult> get connectivityStream {
    _$connectivityStreamAtom.reportRead();
    return super.connectivityStream;
  }

  @override
  set connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$connectivityStreamAtom.reportWrite(value, super.connectivityStream, () {
      super.connectivityStream = value;
    });
  }

  late final _$isConnectedAtom = Atom(
      name: '_GetOnConnectivityChangedStoreBase.isConnected', context: context);

  @override
  bool get isConnected {
    _$isConnectedAtom.reportRead();
    return super.isConnected;
  }

  @override
  set isConnected(bool value) {
    _$isConnectedAtom.reportWrite(value, super.isConnected, () {
      super.isConnected = value;
    });
  }

  late final _$_GetOnConnectivityChangedStoreBaseActionController =
      ActionController(
          name: '_GetOnConnectivityChangedStoreBase', context: context);

  @override
  dynamic setMostRecentResult(ConnectivityResult newResult) {
    final _$actionInfo =
        _$_GetOnConnectivityChangedStoreBaseActionController.startAction(
            name: '_GetOnConnectivityChangedStoreBase.setMostRecentResult');
    try {
      return super.setMostRecentResult(newResult);
    } finally {
      _$_GetOnConnectivityChangedStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic callAndListen() {
    final _$actionInfo = _$_GetOnConnectivityChangedStoreBaseActionController
        .startAction(name: '_GetOnConnectivityChangedStoreBase.callAndListen');
    try {
      return super.callAndListen();
    } finally {
      _$_GetOnConnectivityChangedStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityStream: ${connectivityStream},
isConnected: ${isConnected}
    ''';
  }
}
