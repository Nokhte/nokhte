// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_scheduling_request_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendSchedulingRequestStore on _SendSchedulingRequestStoreBase, Store {
  late final _$futureStoreAtom = Atom(
      name: '_SendSchedulingRequestStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<P2PSchedulingRequestStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<P2PSchedulingRequestStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$isSentAtom =
      Atom(name: '_SendSchedulingRequestStoreBase.isSent', context: context);

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
      AsyncAction('_SendSchedulingRequestStoreBase.call', context: context);

  @override
  Future<void> call(SendSchedulingRequestParamEntity params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
futureStore: ${futureStore},
isSent: ${isSent}
    ''';
  }
}
