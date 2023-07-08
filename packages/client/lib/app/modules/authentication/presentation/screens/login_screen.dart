// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_provider_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_state_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/keys.dart';

class LoginScreen extends StatefulWidget {
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  const LoginScreen({
    Key? key,
    required this.authProviderStore,
    required this.authStateStore,
  }) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState(
        authProviderStore: authProviderStore,
        authStateStore: authStateStore,
      );
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;

  _LoginScreenState({
    required this.authProviderStore,
    required this.authStateStore,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: authStateStore.authState,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            Modular.to.navigate('/home/');
          }
          return PlatformScaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlatformElevatedButton(
                    key: K.signInWithAppleButton,
                    child: const Text("Sign in With Apple"),
                    onPressed: () => authProviderStore.routeAuthProviderRequest(
                      AuthProvider.apple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PlatformElevatedButton(
                    key: K.signInWithGoogleButton,
                    child: const Text("Sign in With Google"),
                    onPressed: () => authProviderStore.routeAuthProviderRequest(
                      AuthProvider.google,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
