// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_coordinator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenCoordinatorStore on _LoginScreenCoordinatorStoreBase, Store {
  late final _$showTextAtom =
      Atom(name: '_LoginScreenCoordinatorStoreBase.showText', context: context);

  @override
  bool get showText {
    _$showTextAtom.reportRead();
    return super.showText;
  }

  @override
  set showText(bool value) {
    _$showTextAtom.reportWrite(value, super.showText, () {
      super.showText = value;
    });
  }

  late final _$authProviderAtom = Atom(
      name: '_LoginScreenCoordinatorStoreBase.authProvider', context: context);

  @override
  AuthProvider get authProvider {
    _$authProviderAtom.reportRead();
    return super.authProvider;
  }

  @override
  set authProvider(AuthProvider value) {
    _$authProviderAtom.reportWrite(value, super.authProvider, () {
      super.authProvider = value;
    });
  }

  late final _$logTheUserInAsyncAction = AsyncAction(
      '_LoginScreenCoordinatorStoreBase.logTheUserIn',
      context: context);

  @override
  Future logTheUserIn(AuthProvider authProvider) {
    return _$logTheUserInAsyncAction
        .run(() => super.logTheUserIn(authProvider));
  }

  late final _$_LoginScreenCoordinatorStoreBaseActionController =
      ActionController(
          name: '_LoginScreenCoordinatorStoreBase', context: context);

  @override
  dynamic screenConstructor() {
    final _$actionInfo =
        _$_LoginScreenCoordinatorStoreBaseActionController.startAction(
            name: '_LoginScreenCoordinatorStoreBase.screenConstructor');
    try {
      return super.screenConstructor();
    } finally {
      _$_LoginScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic flipTextVisibility() {
    final _$actionInfo =
        _$_LoginScreenCoordinatorStoreBaseActionController.startAction(
            name: '_LoginScreenCoordinatorStoreBase.flipTextVisibility');
    try {
      return super.flipTextVisibility();
    } finally {
      _$_LoginScreenCoordinatorStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showText: ${showText},
authProvider: ${authProvider}
    ''';
  }
}
