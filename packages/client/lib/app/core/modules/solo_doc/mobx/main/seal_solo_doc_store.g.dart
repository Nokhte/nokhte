// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seal_solo_doc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SealSoloDocStore on _SealSoloDocStoreBase, Store {
  late final _$isSealedAtom =
      Atom(name: '_SealSoloDocStoreBase.isSealed', context: context);

  @override
  bool get isSealed {
    _$isSealedAtom.reportRead();
    return super.isSealed;
  }

  @override
  set isSealed(bool value) {
    _$isSealedAtom.reportWrite(value, super.isSealed, () {
      super.isSealed = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_SealSoloDocStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<SoloDocSealingStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<SoloDocSealingStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_SealSoloDocStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isSealed: ${isSealed},
futureStore: ${futureStore}
    ''';
  }
}
