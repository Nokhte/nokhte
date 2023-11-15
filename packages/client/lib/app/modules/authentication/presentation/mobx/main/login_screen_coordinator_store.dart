// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/types/directions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'auth_provider_store.dart';
import 'auth_state_store.dart';
part 'login_screen_coordinator_store.g.dart';

class LoginScreenCoordinatorStore = _LoginScreenCoordinatorStoreBase
    with _$LoginScreenCoordinatorStore;

abstract class _LoginScreenCoordinatorStoreBase extends Equatable with Store {
  final GesturePillStore gesturePillStore;
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final SwipeDetector swipe;

  final FadeInAndChangeColorTextStore textStore;

  _LoginScreenCoordinatorStoreBase({
    required this.authProviderStore,
    required this.authStateStore,
    required this.textStore,
    required this.swipe,
    required this.gesturePillStore,
  });

  @observable
  bool showText = false;

  @observable
  AuthProvider authProvider =
      Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;

  @action
  screenConstructor() {
    gesturePillStore
        .setPillMovie(BottomCircleGoesUp.getMovie(firstGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ], secondGradientColors: [
      const Color(0xFF41D2F8),
      const Color(0xFF69E9BC),
    ]));
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
    textStore.setCurrentMessage(
        "Swipe to Log In with ${authProvider.name[0].toUpperCase() + authProvider.name.substring(1)}");
    gestureListener();
    authProvider =
        Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;
    // if (kDebugMode) {
    //   authProvider = AuthProvider.google;
    // }
  }

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            logTheUserIn(authProvider);
          default:
            break;
        }
      });

  @action
  flipTextVisibility() {
    showText = !showText;
  }

  @action
  logTheUserIn(AuthProvider authProvider) async {
    gesturePillStore.setPillAnimationControl(Control.playFromStart);

    await authProviderStore.routeAuthProviderRequest(authProvider);
  }

  @override
  List<Object> get props => [];
}
