// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_scheduling_time_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmSchedulingTimeStore on _ConfirmSchedulingTimeStoreBase, Store {
  late final _$futureStoreAtom = Atom(
      name: '_ConfirmSchedulingTimeStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<ConfirmP2PSchedulingTimeStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<ConfirmP2PSchedulingTimeStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$isSentAtom =
      Atom(name: '_ConfirmSchedulingTimeStoreBase.isSent', context: context);

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
      AsyncAction('_ConfirmSchedulingTimeStoreBase.call', context: context);

  @override
  Future<void> call(ConfirmSchedulingTimeParams params) {
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
