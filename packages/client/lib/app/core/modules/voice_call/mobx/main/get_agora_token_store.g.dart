// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_agora_token_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAgoraTokenStore on _GetAgoraTokenStoreBase, Store {
  late final _$futureStoreAtom =
      Atom(name: '_GetAgoraTokenStoreBase.futureStore', context: context);

  @override
  BaseFutureStore<AgoraCallTokenEntity> get futureStore {
    _$futureStoreAtom.reportRead();
    return super.futureStore;
  }

  @override
  set futureStore(BaseFutureStore<AgoraCallTokenEntity> value) {
    _$futureStoreAtom.reportWrite(value, super.futureStore, () {
      super.futureStore = value;
    });
  }

  late final _$tokenAtom =
      Atom(name: '_GetAgoraTokenStoreBase.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$callAsyncAction =
      AsyncAction('_GetAgoraTokenStoreBase.call', context: context);

  @override
  Future<void> call(dynamic params) {
    return _$callAsyncAction.run(() => super.call(params));
  }

  @override
  String toString() {
    return '''
futureStore: ${futureStore},
token: ${token}
    ''';
  }
}
