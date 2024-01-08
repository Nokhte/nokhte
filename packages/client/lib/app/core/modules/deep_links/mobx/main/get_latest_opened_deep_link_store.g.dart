// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_latest_opened_deep_link_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetLatestOpenedDeepLinkStore
    on _GetLatestOpenedDeepLinkStoreBase, Store {
  late final _$deepLinkTypeAtom = Atom(
      name: '_GetLatestOpenedDeepLinkStoreBase.deepLinkType', context: context);

  @override
  DeepLinkTypes get deepLinkType {
    _$deepLinkTypeAtom.reportRead();
    return super.deepLinkType;
  }

  @override
  set deepLinkType(DeepLinkTypes value) {
    _$deepLinkTypeAtom.reportWrite(value, super.deepLinkType, () {
      super.deepLinkType = value;
    });
  }

  late final _$additionalMetadataAtom = Atom(
      name: '_GetLatestOpenedDeepLinkStoreBase.additionalMetadata',
      context: context);

  @override
  ObservableMap<dynamic, dynamic> get additionalMetadata {
    _$additionalMetadataAtom.reportRead();
    return super.additionalMetadata;
  }

  @override
  set additionalMetadata(ObservableMap<dynamic, dynamic> value) {
    _$additionalMetadataAtom.reportWrite(value, super.additionalMetadata, () {
      super.additionalMetadata = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_GetLatestOpenedDeepLinkStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<DeepLinkInfoEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<DeepLinkInfoEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetLatestOpenedDeepLinkStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
deepLinkType: ${deepLinkType},
additionalMetadata: ${additionalMetadata},
futureStore: ${futureStore}
    ''';
  }
}
