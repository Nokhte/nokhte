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
  bool isLoggedIn = false;

  @observable
  bool hasAttemptedToLogin = false;

  @action
  toggleHasAttemptedToLogin() => hasAttemptedToLogin = !hasAttemptedToLogin;

  @observable
  AuthProvider authProvider =
      Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;

  @action
  constructor(Offset center) {
    widgets.constructor(center, logTheUserIn, onConnected, onDisconnected);
    authStateListener(authStateStore.authState);
    initReactors();
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
  }

  initReactors() {
    swipeReactor();
    tapReactor();
    authStateReactor();
  }

  @action
  onConnected() {
    if (disableAllTouchFeedback) {
      toggleDisableAllTouchFeedback();
    }
  }

  @action
  onDisconnected() {
    if (!disableAllTouchFeedback) {
      toggleDisableAllTouchFeedback();
    }
  }

  @action
  logTheUserIn() async {
    await signInWithAuthProvider.routeAuthProviderRequest(authProvider);
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            ifTouchIsNotDisabled(() {
              toggleHasAttemptedToLogin();
              widgets.onSwipeUp();
            });
          default:
            break;
        }
      });

  tapReactor() => reaction(
        (p0) => tap.tapCount,
        (p0) => ifTouchIsNotDisabled(() => widgets.onTap(
              tap.currentTapPosition,
            )),
      );

  @action
  authStateListener(Stream<bool> authStateStream) =>
      authStateStream.listen((event) => isLoggedIn = event);

  authStateReactor() => reaction((p0) => isLoggedIn, (p0) {
        if (p0) {
          widgets.loggedInOnResumed();
        }
      });

  @action
  onResumed() {
    if (!isLoggedIn) {
      widgets.loggedOutOnResumed();
      if (hasAttemptedToLogin) {
        toggleHasAttemptedToLogin();
      }
    }
  }

  @action
  onInactive() {
    if (isLoggedIn) {
      widgets.loggedInOnInactive();
    } else {
      widgets.loggedOutOnInactive();
    }
  }
}
