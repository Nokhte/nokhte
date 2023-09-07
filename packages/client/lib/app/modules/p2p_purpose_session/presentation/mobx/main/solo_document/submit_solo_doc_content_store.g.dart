// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_solo_doc_content_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubmitSoloDocContentStore on _SubmitSoloDocContentStoreBase, Store {
  late final _$isSubmittedAtom = Atom(
      name: '_SubmitSoloDocContentStoreBase.isSubmitted', context: context);

  @override
  bool get isSubmitted {
    _$isSubmittedAtom.reportRead();
    return super.isSubmitted;
  }

  @override
  set isSubmitted(bool value) {
    _$isSubmittedAtom.reportWrite(value, super.isSubmitted, () {
      super.isSubmitted = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_SubmitSoloDocContentStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<SoloDocSubmissionStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<SoloDocSubmissionStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_SubmitSoloDocContentStoreBase.call', context: context);

  @override
  Future<void> call(SubmitSoloDocContentParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isSubmitted: ${isSubmitted},
futureStore: ${futureStore}
    ''';
  }
}
