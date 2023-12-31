// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthProviderStore on _AuthProviderStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_AuthProviderStoreBase.state', context: context);

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_AuthProviderStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$routeAuthProviderRequestAsyncAction = AsyncAction(
      '_AuthProviderStoreBase.routeAuthProviderRequest',
      context: context);

  @override
  Future<void> routeAuthProviderRequest(AuthProvider authProvider) {
    return _$routeAuthProviderRequestAsyncAction
        .run(() => super.routeAuthProviderRequest(authProvider));
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage}
    ''';
  }
}
