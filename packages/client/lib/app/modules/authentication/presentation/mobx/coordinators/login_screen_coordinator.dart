// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/logic.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
part 'login_screen_coordinator.g.dart';

class LoginScreenCoordinator = _LoginScreenCoordinatorBase
    with _$LoginScreenCoordinator;

abstract class _LoginScreenCoordinatorBase extends BaseCoordinator with Store {
  final LoginScreenWidgetsCoordinator widgets;
  final SignInWithAuthProviderStore signInWithAuthProvider;
  final GetUserInfoStore getUserInfo;
  final AddName addName;
  final GetAuthStateStore authStateStore;
  final SwipeDetector swipe;
  final TapDetector tap;

  _LoginScreenCoordinatorBase({
    required this.signInWithAuthProvider,
    required this.widgets,
    required this.authStateStore,
    required this.addName,
    required this.getUserInfo,
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
    widgets.wifiDisconnectOverlay.initReactors(onQuickConnected: () {
      setDisableAllTouchFeedback(false);
    }, onLongReConnected: () {
      widgets.onLongReConnected();
      setDisableAllTouchFeedback(false);
    }, onDisconnected: () {
      setDisableAllTouchFeedback(true);
    });
    widgets.layer2BeachWavesReactor(onHomeTransitionComplete);
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

  onHomeTransitionComplete() {
    final params = ResumeOnShoreParams.initial();
    final args = {"resumeOnShoreParams": params};
    if (!getUserInfo.hasGoneThroughInvitationFlow) {
      Modular.to.navigate("/home/phase1", arguments: args);
    } else if (getUserInfo.hasGoneThroughInvitationFlow) {
      Modular.to.navigate("/home/phase2", arguments: args);
    } else if (getUserInfo.hasDoneASession) {
      Modular.to.navigate("/home/phase3", arguments: args);
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

  authStateReactor() => reaction((p0) => isLoggedIn, (p0) async {
        if (p0) {
          await addName(NoParams());
          await getUserInfo(NoParams());
          widgets.loggedInOnResumed();
        }
      });

  @action
  onResumed() {
    if (disableAllTouchFeedback) {
      widgets.smartTextStore.pause();
    } else if (!isLoggedIn) {
      widgets.loggedOutOnResumed();
      if (hasAttemptedToLogin) {
        toggleHasAttemptedToLogin();
      }
    }
  }

  @action
  onInactive() {
    if (!isLoggedIn) {
      widgets.loggedOutOnInactive();
    }
  }
}
