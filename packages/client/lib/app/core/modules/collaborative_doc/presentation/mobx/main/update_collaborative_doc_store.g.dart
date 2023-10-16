// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collaborative_doc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UpdateCollaborativeDocStore on _UpdateCollaborativeDocStoreBase, Store {
  late final _$isUpdatedAtom = Atom(
      name: '_UpdateCollaborativeDocStoreBase.isUpdated', context: context);

  @override
  bool get isUpdated {
    _$isUpdatedAtom.reportRead();
    return super.isUpdated;
  }

  @override
  set isUpdated(bool value) {
    _$isUpdatedAtom.reportWrite(value, super.isUpdated, () {
      super.isUpdated = value;
    });
  }

  late final _$futureStoreAtom = Atom(
      name: '_UpdateCollaborativeDocStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<CollaborativeDocUpdateStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<CollaborativeDocUpdateStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_UpdateCollaborativeDocStoreBase.call', context: context);

  @override
  Future<void> call(UpdateCollaborativeDocParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  late final _$_UpdateCollaborativeDocStoreBaseActionController =
      ActionController(
          name: '_UpdateCollaborativeDocStoreBase', context: context);

  @override
  dynamic setToDefault() {
    final _$actionInfo = _$_UpdateCollaborativeDocStoreBaseActionController
        .startAction(name: '_UpdateCollaborativeDocStoreBase.setToDefault');
    try {
      return super.setToDefault();
    } finally {
      _$_UpdateCollaborativeDocStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isUpdated: ${isUpdated},
futureStore: ${futureStore}
    ''';
  }
}
