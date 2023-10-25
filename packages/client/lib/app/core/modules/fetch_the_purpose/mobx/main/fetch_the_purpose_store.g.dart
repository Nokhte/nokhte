// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_the_purpose_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FetchThePurposeStore on _FetchThePurposeStoreBase, Store {
  late final _$thePurposeAtom =
      Atom(name: '_FetchThePurposeStoreBase.thePurpose', context: context);

  @override
  String get thePurpose {
    _$thePurposeAtom.reportRead();
    return super.thePurpose;
  }

  @override
  set thePurpose(String value) {
    _$thePurposeAtom.reportWrite(value, super.thePurpose, () {
      super.thePurpose = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_FetchThePurposeStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollectivePurposeEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollectivePurposeEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_FetchThePurposeStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
thePurpose: ${thePurpose},
futureStore: ${futureStore}
    ''';
  }
}
