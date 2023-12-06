// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instantiate_agora_sdk_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstantiateAgoraSdkStore on _InstantiateAgoraSdkStoreBase, Store {
  late final _$isInstantiatedAtom = Atom(
      name: '_InstantiateAgoraSdkStoreBase.isInstantiated', context: context);

  @override
  bool get isInstantiated {
    _$isInstantiatedAtom.reportRead();
    return super.isInstantiated;
  }

  @override
  set isInstantiated(bool value) {
    _$isInstantiatedAtom.reportWrite(value, super.isInstantiated, () {
      super.isInstantiated = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_InstantiateAgoraSdkStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<AgoraSdkStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<AgoraSdkStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_InstantiateAgoraSdkStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isInstantiated: ${isInstantiated},
futureStore: ${futureStore}
    ''';
  }
}
