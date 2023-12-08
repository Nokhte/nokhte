// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
part 'login_screen_coordinator.g.dart';

class LoginScreenCoordinator = _LoginScreenCoordinatorBase
    with _$LoginScreenCoordinator;

abstract class _LoginScreenCoordinatorBase extends BaseCoordinator with Store {
  final LoginScreenWidgetsCoordinator widgets;
  final SignInWithAuthProviderStore signInWithAuthProvider;
  final GetAuthStateStore authStateStore;
  final SwipeDetector swipe;
  final TapDetector tap;

  _LoginScreenCoordinatorBase({
    required this.signInWithAuthProvider,
    required this.widgets,
    required this.authStateStore,
    required this.tap,
    required this.swipe,
  });

  @observable
  AuthProvider authProvider =
      Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;

  @action
  screenConstructor(Offset center) {
    widgets.constructor(center);
    initReactors();
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
  }

  initReactors() {
    swipeReactor();
    tapReactor();
    foregroundAndBackgroundStateReactor(
      resumedCallback: () => widgets.onResumed(),
      inactiveCallback: () => widgets.onInactive(),
      detachedCallback: () => null,
    );
  }

  @action
  logTheUserIn(AuthProvider authProvider) async {
    await signInWithAuthProvider.routeAuthProviderRequest(authProvider);
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
          // logTheUserIn(authProvider);
          default:
            break;
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => widgets.onTap(tap.currentTapPosition),
      );

  @override
  List<Object> get props => [];
}
