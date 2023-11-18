// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_the_timer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeleteTheTimerStore on _DeleteTheTimerStoreBase, Store {
  late final _$isDeletedAtom =
      Atom(name: '_DeleteTheTimerStoreBase.isDeleted', context: context);

  @override
  bool get isDeleted {
    _$isDeletedAtom.reportRead();
    return super.isDeleted;
  }

  @override
  set isDeleted(bool value) {
    _$isDeletedAtom.reportWrite(value, super.isDeleted, () {
      super.isDeleted = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_DeleteTheTimerStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<TimerDeletionStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<TimerDeletionStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_DeleteTheTimerStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isDeleted: ${isDeleted},
futureStore: ${futureStore}
    ''';
  }
}
