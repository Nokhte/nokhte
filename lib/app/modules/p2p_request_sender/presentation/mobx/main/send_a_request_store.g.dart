// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_a_request_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendARequestStore on _SendARequestStore, Store {
  late final _$futureStoreAtom =
      Atom(name: '_SendARequestStore.futureStore', context: context);

  @override
  BaseFutureStore<P2PRequestSenderStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<P2PRequestSenderStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$isSentAtom =
      Atom(name: '_SendARequestStore.isSent', context: context);

  @override
  bool get isSent {
    _$isSentAtom.reportRead();
    return super.isSent;
  }

  @override
  set isSent(bool value) {
    _$isSentAtom.reportWrite(value, super.isSent, () {
      super.isSent = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_SendARequestStore.call', context: context);

  @override
  Future<void> call(P2PSendReqParams param) {
    return _$callAsyncAction.run(() => super.call(param));
  }

  late final _$_SendARequestStoreActionController =
      ActionController(name: '_SendARequestStore', context: context);

  @override
  void stateOrErrorUpdater(
      Either<Failure, P2PRequestSenderStatusEntity> result) {
    final _$actionInfo = _$_SendARequestStoreActionController.startAction(
        name: '_SendARequestStore.stateOrErrorUpdater');
    try {
      return super.stateOrErrorUpdater(result);
    } finally {
      _$_SendARequestStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
futureStore: ${futureStore},
isSent: ${isSent}
    ''';
  }
}
