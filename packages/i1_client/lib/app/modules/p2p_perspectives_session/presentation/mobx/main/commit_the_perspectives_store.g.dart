// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commit_the_perspectives_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommitThePerspectivesStore on _CommitThePerspectivesStoreBase, Store {
  late final _$isCommittedAtom = Atom(
      name: '_CommitThePerspectivesStoreBase.isCommitted', context: context);

  @override
  bool get isCommitted {
    _$isCommittedAtom.reportRead();
    return super.isCommitted;
  }

  @override
  set isCommitted(bool value) {
    _$isCommittedAtom.reportWrite(value, super.isCommitted, () {
      super.isCommitted = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_CommitThePerspectivesStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<PerspectivesCommitStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<PerspectivesCommitStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_CommitThePerspectivesStoreBase.call', context: context);

  @override
  Future<void> call(List<String> params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isCommitted: ${isCommitted},
futureStore: ${futureStore}
    ''';
  }
}
