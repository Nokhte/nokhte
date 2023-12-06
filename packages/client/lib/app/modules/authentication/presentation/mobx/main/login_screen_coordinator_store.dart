// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/auth_providers.dart';
import 'package:nokhte/app/core/types/directions.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/beach_wave_movie_modes.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'auth_provider_store.dart';
import 'auth_state_store.dart';
part 'login_screen_coordinator_store.g.dart';

class LoginScreenCoordinatorStore = _LoginScreenCoordinatorStoreBase
    with _$LoginScreenCoordinatorStore;

abstract class _LoginScreenCoordinatorStoreBase extends Equatable with Store {
  final BeachWavesStore beachWaves;

  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final SwipeDetector swipe;

  _LoginScreenCoordinatorStoreBase({
    required this.authProviderStore,
    required this.beachWaves,
    required this.authStateStore,
    required this.swipe,
  });

  @observable
  AuthProvider authProvider =
      Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;

  @action
  screenConstructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.blackOut);
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
    gestureListener();
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
  logTheUserIn(AuthProvider authProvider) async {
    await authProviderStore.routeAuthProviderRequest(authProvider);
  }

  @override
  List<Object> get props => [];
}
