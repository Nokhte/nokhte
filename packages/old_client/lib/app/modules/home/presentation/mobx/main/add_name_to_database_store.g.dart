// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_name_to_database_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNameToDatabaseStore on _AddNameToDatabaseStoreBase, Store {
  late final _$futureStoreAtom =
      Atom(name: '_AddNameToDatabaseStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<NameCreationStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<NameCreationStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_AddNameToDatabaseStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
futureStore: ${futureStore}
    ''';
  }
}
