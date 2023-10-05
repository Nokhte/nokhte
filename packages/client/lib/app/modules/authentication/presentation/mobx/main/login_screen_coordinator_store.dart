// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:primala/app/core/widgets/widgets.dart';

import 'auth_provider_store.dart';
import 'auth_state_store.dart';
// * Mobx Codegen Inclusion
part 'login_screen_coordinator_store.g.dart';

class LoginScreenCoordinatorStore = _LoginScreenCoordinatorStoreBase
    with _$LoginScreenCoordinatorStore;

abstract class _LoginScreenCoordinatorStoreBase extends Equatable with Store {
  final GesturePillStore gesturePillStore;
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final FadeInAndChangeColorTextStore textStore;

  _LoginScreenCoordinatorStoreBase({
    required this.authProviderStore,
    required this.authStateStore,
    required this.textStore,
    required this.gesturePillStore,
  });

  @observable
  bool showText = false;

  AuthProvider authProvider =
      Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;

  @action
  screenConstructor() {
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
    textStore.setCurrentMessage(
        "Swipe to Log In with ${authProvider.name[0].toUpperCase() + authProvider.name.substring(1)}");
  }

  @action
  flipTextVisibility() {
    showText = !showText;
  }

  @action
  loginScreenSwipeUpCallback(AuthProvider authProvider) async {
    gesturePillStore.startTheAnimation();
    await authProviderStore.routeAuthProviderRequest(authProvider);
  }

  @override
  List<Object> get props => [];
}
