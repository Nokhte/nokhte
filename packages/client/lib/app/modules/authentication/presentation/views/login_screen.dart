/// new_login_screen.dart
/// TODO: UPDATE DOCS IT'S OUTDATED
///  Proofreading Information:
///   - Proofreader: Sonny Vesali
///   - Date: July 23rd 2023
///
/// Author: Sonny Vesali
///
/// This file defines the [NewLoginScreen] widget, which serves as a login
/// screen that allows platform-specific sign-in with Apple for iOS devices and
/// Google for Android devices. The login screen uses [Swipe] to initiate the
/// authentication process when the user swipes up on the screen.
///
/// [NewLoginScreen] extends [StatefulWidget] and receives several stores and a
/// Supabase client as constructor parameters. The stores include
/// [AuthProviderStore], [AuthStateStore], and [AddNameToDatabaseStore], which
/// handle authentication provider selection, authentication state management,
/// and adding user information to the database, respectively.
///
/// The [NewLoginScreen] widget listens to the [authStateStore.authState]
/// stream. If the stream data becomes true, indicating that the user is
/// authenticated, it calls the [addNameToDatabaseStore.call(NoParams())]
/// method and navigates to the home screen.
///
/// The UI of the [NewLoginScreen] contains two main components:
///   1. A backdrop animation of water using the [WaterAnimation] widget, which
///      as it sounds like, shows a water animation instead of ugly buttons.
///   2. A text prompt appearing at the bottom of the screen, guiding the user
///      to swipe up to log in with either Apple or Google, depending on the
///      platform, Google For Android & Apple for iOS.
///
/// Note: The ignore_for_file directive is used to suppress warnings about logic
/// being present in the createState method.

// ignore_for_file: no_logic_in_create_state

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'dart:io';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/core/widgets/widget_constants.dart';
import 'package:primala/app/modules/authentication/presentation/presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:swipe/swipe.dart';

class LoginScreen extends StatelessWidget {
  final LoginScreenCoordinatorStore loginCoordinatorStore;
  LoginScreen({
    super.key,
    required this.loginCoordinatorStore,
  }) {
    loginCoordinatorStore.flipTextVisibility();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
    return StreamBuilder<bool>(
        stream: loginCoordinatorStore.authStateStore.authState,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            Modular.to.navigate('/home/');
          }
          return PlatformScaffold(
            body: Swipe(
              onSwipeUp: () async => await loginCoordinatorStore
                  .loginScreenSwipeUpCallback(authProvider),
              child: Stack(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: DumbBeachWaves(movie: OnShore.movie)),
                  Observer(builder: (context) {
                    return Container(
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(30.0),
                      child: AnimatedOpacity(
                        opacity: loginCoordinatorStore.showText ? 1 : 0,
                        duration: const Duration(seconds: 1),
                        child: PlatformText(
                          "Swipe to Log In with ${authProvider.name[0].toUpperCase() + authProvider.name.substring(1)}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          );
        });
  }
}
