// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_screen_coordinator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginScreenCoordinator on _LoginScreenCoordinatorBase, Store {
  late final _$isLoggedInAtom =
      Atom(name: '_LoginScreenCoordinatorBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$hasAttemptedToLoginAtom = Atom(
      name: '_LoginScreenCoordinatorBase.hasAttemptedToLogin',
      context: context);

  @override
  bool get hasAttemptedToLogin {
    _$hasAttemptedToLoginAtom.reportRead();
    return super.hasAttemptedToLogin;
  }

  @override
  set hasAttemptedToLogin(bool value) {
    _$hasAttemptedToLoginAtom.reportWrite(value, super.hasAttemptedToLogin, () {
      super.hasAttemptedToLogin = value;
    });
  }

  late final _$authProviderAtom =
      Atom(name: '_LoginScreenCoordinatorBase.authProvider', context: context);

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

  late final _$logTheUserInAsyncAction =
      AsyncAction('_LoginScreenCoordinatorBase.logTheUserIn', context: context);

  @override
  Future logTheUserIn() {
    return _$logTheUserInAsyncAction.run(() => super.logTheUserIn());
  }

  late final _$_LoginScreenCoordinatorBaseActionController =
      ActionController(name: '_LoginScreenCoordinatorBase', context: context);

  @override
  dynamic toggleHasAttemptedToLogin() {
    final _$actionInfo =
        _$_LoginScreenCoordinatorBaseActionController.startAction(
            name: '_LoginScreenCoordinatorBase.toggleHasAttemptedToLogin');
    try {
      return super.toggleHasAttemptedToLogin();
    } finally {
      _$_LoginScreenCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic screenConstructor(Offset center) {
    final _$actionInfo = _$_LoginScreenCoordinatorBaseActionController
        .startAction(name: '_LoginScreenCoordinatorBase.screenConstructor');
    try {
      return super.screenConstructor(center);
    } finally {
      _$_LoginScreenCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onConnected() {
    final _$actionInfo = _$_LoginScreenCoordinatorBaseActionController
        .startAction(name: '_LoginScreenCoordinatorBase.onConnected');
    try {
      return super.onConnected();
    } finally {
      _$_LoginScreenCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDisconnected() {
    final _$actionInfo = _$_LoginScreenCoordinatorBaseActionController
        .startAction(name: '_LoginScreenCoordinatorBase.onDisconnected');
    try {
      return super.onDisconnected();
    } finally {
      _$_LoginScreenCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic authStateListener(Stream<bool> authStateStream) {
    final _$actionInfo = _$_LoginScreenCoordinatorBaseActionController
        .startAction(name: '_LoginScreenCoordinatorBase.authStateListener');
    try {
      return super.authStateListener(authStateStream);
    } finally {
      _$_LoginScreenCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onResumed() {
    final _$actionInfo = _$_LoginScreenCoordinatorBaseActionController
        .startAction(name: '_LoginScreenCoordinatorBase.onResumed');
    try {
      return super.onResumed();
    } finally {
      _$_LoginScreenCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onInactive() {
    final _$actionInfo = _$_LoginScreenCoordinatorBaseActionController
        .startAction(name: '_LoginScreenCoordinatorBase.onInactive');
    try {
      return super.onInactive();
    } finally {
      _$_LoginScreenCoordinatorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoggedIn: ${isLoggedIn},
hasAttemptedToLogin: ${hasAttemptedToLogin},
authProvider: ${authProvider}
    ''';
  }
}
