// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_auth_provider_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInWithAuthProviderStore on _SignInWithAuthProviderStoreBase, Store {
  late final _$authProviderRequestStatusAtom = Atom(
      name: '_SignInWithAuthProviderStoreBase.authProviderRequestStatus',
      context: context);

  @override
  bool get authProviderRequestStatus {
    _$authProviderRequestStatusAtom.reportRead();
    return super.authProviderRequestStatus;
  }

  @override
  set authProviderRequestStatus(bool value) {
    _$authProviderRequestStatusAtom
        .reportWrite(value, super.authProviderRequestStatus, () {
      super.authProviderRequestStatus = value;
    });
  }

  late final _$routeAuthProviderRequestAsyncAction = AsyncAction(
      '_SignInWithAuthProviderStoreBase.routeAuthProviderRequest',
      context: context);

  @override
  Future<Either<Failure, AuthProviderEntity>> routeAuthProviderRequest(
      AuthProvider authProvider) {
    return _$routeAuthProviderRequestAsyncAction
        .run(() => super.routeAuthProviderRequest(authProvider));
  }

  late final _$callAsyncAction =
      AsyncAction('_SignInWithAuthProviderStoreBase.call', context: context);

  @override
  Future<void> call(AuthProvider authProvider) {
    return _$callAsyncAction.run(() => super.call(authProvider));
  }

  @override
  String toString() {
    return '''
authProviderRequestStatus: ${authProviderRequestStatus}
    ''';
  }
}
