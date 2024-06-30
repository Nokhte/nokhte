// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/login/domain/logic/add_metadata.dart';
import 'package:nokhte/app/modules/login/login.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'login_coordinator.g.dart';

class LoginCoordinator = _LoginCoordinatorBase with _$LoginCoordinator;

abstract class _LoginCoordinatorBase
    with Store, HomeScreenRouter, BaseCoordinator, Reactions {
  final LoginScreenWidgetsCoordinator widgets;
  final SignInWithAuthProviderStore signInWithAuthProvider;
  final AddName addName;
  final AddMetadata addMetadata;
  final GetLoginStateStore authStateStore;
  final SwipeDetector swipe;
  final TapDetector tap;
  final IdentifyUser identifyUser;
  @override
  final GetUserInfoStore getUserInfo;
  @override
  final CaptureScreen captureScreen;

  _LoginCoordinatorBase({
    required this.signInWithAuthProvider,
    required this.widgets,
    required this.addMetadata,
    required this.authStateStore,
    required this.addName,
    required this.getUserInfo,
    required this.identifyUser,
    required this.tap,
    required this.swipe,
    required this.captureScreen,
  }) {
    initBaseCoordinatorActions();
  }

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
  constructor(Offset center) async {
    widgets.constructor(center, logTheUserIn, onConnected, onDisconnected);
    authStateListener(authStateStore.authState);
    initReactors();
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
    await captureScreen(LoginConstants.root);
  }

  initReactors() {
    disposers.add(swipeReactor());
    disposers.add(tapReactor());

    disposers.addAll(
        widgets.wifiDisconnectOverlay.initReactors(onQuickConnected: () {
      setDisableAllTouchFeedback(false);
    }, onLongReConnected: () {
      widgets.onLongReConnected();
      setDisableAllTouchFeedback(false);
    }, onDisconnected: () {
      setDisableAllTouchFeedback(true);
    }));
    disposers.add(widgets.layer2BeachWavesReactor(onAnimationComplete));
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

  ReactionDisposer swipeReactor() =>
      reaction((p0) => swipe.directionsType, (p0) {
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
      authStateStream.listen((isLoggedIn) async {
        if (isLoggedIn) {
          widgets.loggedInOnResumed();
          await addName(NoParams());
          await addMetadata(NoParams());
          await getUserInfo(NoParams());
          await identifyUser(NoParams());
        }
      });

  @action
  onResumed() {
    if (!isLoggedIn) {
      widgets.loggedOutOnResumed();
    }
  }

  deconstructor() {
    dispose();
    widgets.dispose();
  }
}
