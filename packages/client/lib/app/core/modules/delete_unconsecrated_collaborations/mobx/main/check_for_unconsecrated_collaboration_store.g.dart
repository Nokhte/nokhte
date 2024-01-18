// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_for_unconsecrated_collaboration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckForUnconsecratedCollaborationStore
    on _CheckForUnconsecratedCollaborationStoreBase, Store {
  late final _$hasAnUnconsecratedCollaborationAtom = Atom(
      name:
          '_CheckForUnconsecratedCollaborationStoreBase.hasAnUnconsecratedCollaboration',
      context: context);

  @override
  bool get hasAnUnconsecratedCollaboration {
    _$hasAnUnconsecratedCollaborationAtom.reportRead();
    return super.hasAnUnconsecratedCollaboration;
  }

  @override
  set hasAnUnconsecratedCollaboration(bool value) {
    _$hasAnUnconsecratedCollaborationAtom
        .reportWrite(value, super.hasAnUnconsecratedCollaboration, () {
      super.hasAnUnconsecratedCollaboration = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_CheckForUnconsecratedCollaborationStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<UnconsecratedCollaborationCheckerEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<UnconsecratedCollaborationCheckerEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_CheckForUnconsecratedCollaborationStoreBase.call',
      context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
hasAnUnconsecratedCollaboration: ${hasAnUnconsecratedCollaboration},
futureStore: ${futureStore}
    ''';
  }
}
