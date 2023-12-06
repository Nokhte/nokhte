// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/beach_wave_movie_modes.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import '../main/auth_provider_store.dart';
import '../main/auth_state_store.dart';
part 'login_screen_coordinator.g.dart';
// fades in properly
// abrubptly transitions through the rest

class LoginScreenCoordinator = _LoginScreenCoordinatorBase
    with _$LoginScreenCoordinator;

abstract class _LoginScreenCoordinatorBase extends Equatable with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartTextStore;
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final SwipeDetector swipe;
  final TapDetector tap;

  _LoginScreenCoordinatorBase({
    required this.authProviderStore,
    required this.smartTextStore,
    required this.beachWaves,
    required this.authStateStore,
    required this.tap,
    required this.swipe,
  });

  @observable
  AuthProvider authProvider =
      Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;

  @observable
  bool hasNotMadeTheDot = true;

  @action
  toggleHasMadeTheDot() => hasNotMadeTheDot = !hasNotMadeTheDot;

  @action
  screenConstructor() {
    smartTextStore.setMessagesData(MessagesData.loginList);
    smartTextStore.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.blackOut);
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
    gestureListener();
    tapListener();
  }

  gestureListener() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.up:
            logTheUserIn(authProvider);
          default:
            break;
        }
      });

  tapListener() => reaction((p0) => tap.tapCount, (p0) {
        if (Gestures.tap == smartTextStore.currentUnlockGesture &&
            hasNotMadeTheDot) {
          smartTextStore.startRotatingText();
          toggleHasMadeTheDot();
        }
      });

  @action
  logTheUserIn(AuthProvider authProvider) async {
    await authProviderStore.routeAuthProviderRequest(authProvider);
  }

  @override
  List<Object> get props => [];
}
