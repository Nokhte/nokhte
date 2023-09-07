// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_solo_doc_content_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetSoloDocContentStore on _GetSoloDocContentStoreBase, Store {
  late final _$docContentAtom =
      Atom(name: '_GetSoloDocContentStoreBase.docContent', context: context);

  @override
  String get docContent {
    _$docContentAtom.reportRead();
    return super.docContent;
  }

  @override
  set docContent(String value) {
    _$docContentAtom.reportWrite(value, super.docContent, () {
      super.docContent = value;
    });
  }

  late final _$futureStoreAtom =
      Atom(name: '_GetSoloDocContentStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<SoloDocContentEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<SoloDocContentEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetSoloDocContentStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
docContent: ${docContent},
futureStore: ${futureStore}
    ''';
  }
}
