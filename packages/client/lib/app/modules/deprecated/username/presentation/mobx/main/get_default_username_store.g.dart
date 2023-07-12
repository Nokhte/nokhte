// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_default_username_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetDefaultUsernameStore on _GetDefaultUsernameStoreBase, Store {
  late final _$futureStoreAtom =
      Atom(name: '_GetDefaultUsernameStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<DefaultUsernameEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<DefaultUsernameEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$defaultUsernameAtom = Atom(
      name: '_GetDefaultUsernameStoreBase.defaultUsername', context: context);

  @override
  String get defaultUsername {
    _$defaultUsernameAtom.reportRead();
    return super.defaultUsername;
  }

  @override
  set defaultUsername(String value) {
    _$defaultUsernameAtom.reportWrite(value, super.defaultUsername, () {
      super.defaultUsername = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetDefaultUsernameStoreBase.call', context: context);

  @override
  Future<void> call(NoParams params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
futureStore: ${futureStore},
defaultUsername: ${defaultUsername}
    ''';
  }
}
