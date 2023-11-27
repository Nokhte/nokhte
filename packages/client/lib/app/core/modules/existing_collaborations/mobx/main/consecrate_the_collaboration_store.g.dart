// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consecrate_the_collaboration_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConsecrateTheCollaborationStore
    on _ConsecrateTheCollaborationStoreBase, Store {
  late final _$isConsecratedAtom = Atom(
      name: '_ConsecrateTheCollaborationStoreBase.isConsecrated',
      context: context);

  @override
  bool get isConsecrated {
    _$isConsecratedAtom.reportRead();
    return super.isConsecrated;
  }

  @override
  set isConsecrated(bool value) {
    _$isConsecratedAtom.reportWrite(value, super.isConsecrated, () {
      super.isConsecrated = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_ConsecrateTheCollaborationStoreBase.futureStore',
      context: context);

  @override
  BaseFutureStore<CollaborationConsecrationStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(
      BaseFutureStore<CollaborationConsecrationStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction = AsyncAction(
      '_ConsecrateTheCollaborationStoreBase.call',
      context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
isConsecrated: ${isConsecrated},
futureStore: ${futureStore}
    ''';
  }
}
