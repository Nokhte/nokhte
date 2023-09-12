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
    loginCoordinatorStore.screenConstructor();
    // loginCoordinatorStore.flipTextVisibility();
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
                      child: FadeInAndChangeColorText(
                        stateStore: loginCoordinatorStore.textStore,
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
