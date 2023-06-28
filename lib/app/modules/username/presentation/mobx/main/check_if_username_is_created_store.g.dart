// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_if_username_is_created_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckIfUsernameIsCreatedStore
    on _CheckIfUsernameIsCreatedStoreBase, Store {
  late final _$futureStoreAtom = Atom(
      name: '_CheckIfUsernameIsCreatedStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<UsernameStatusEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<UsernameStatusEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$usernameIsCreatedAtom = Atom(
      name: '_CheckIfUsernameIsCreatedStoreBase.usernameIsCreated',
      context: context);

  @override
  bool get usernameIsCreated {
    _$usernameIsCreatedAtom.reportRead();
    return super.usernameIsCreated;
  }

  @override
  set usernameIsCreated(bool value) {
    _$usernameIsCreatedAtom.reportWrite(value, super.usernameIsCreated, () {
      super.usernameIsCreated = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_CheckIfUsernameIsCreatedStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
futureStore: ${futureStore},
usernameIsCreated: ${usernameIsCreated}
    ''';
  }
}
