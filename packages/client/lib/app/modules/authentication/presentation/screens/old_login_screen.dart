/// old_login_screen.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [LoginScreen] widget, which serves as a deprecated basic
/// login screen with two buttons for signing in with Apple and Google. The login
/// screen uses [StreamBuilder] to monitor the authentication state and navigate
/// to the home screen once the user is authenticated.
///
/// [LoginScreen] extends [StatefulWidget] and receives several stores and a Supabase
/// client as constructor parameters. The stores include [AuthProviderStore],
/// [AuthStateStore], and [AddNameToDatabaseStore], which handle authentication
/// provider selection, authentication state management, and adding user information
/// to the database, respectively.
///
/// The [LoginScreen] widget listens to the [authStateStore.authState] stream. If the
/// stream data becomes true, indicating that the user is authenticated, it calls the
/// [addNameToDatabaseStore.call(NoParams())] method and navigates to the home screen.
///
/// The UI of the [LoginScreen] contains two [PlatformElevatedButton] widgets, one
/// for signing in with Apple and the other for signing in with Google. Each button
/// triggers the [authProviderStore.routeAuthProviderRequest()] method to initiate
/// the authentication process based on the selected provider.
///
/// Note: The ignore_for_file directive is used to suppress warnings about logic
/// being present in the createState method.

// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/add_name_to_database_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_provider_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_state_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final SupabaseClient supabase;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  const LoginScreen({
    Key? key,
    required this.authProviderStore,
    required this.authStateStore,
    required this.supabase,
    required this.addNameToDatabaseStore,
  }) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState(
        addNameToDatabaseStore: addNameToDatabaseStore,
        authProviderStore: authProviderStore,
        authStateStore: authStateStore,
        supabase: supabase,
      );
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final SupabaseClient supabase;
  final AddNameToDatabaseStore addNameToDatabaseStore;

  _LoginScreenState({
    required this.authProviderStore,
    required this.authStateStore,
    required this.addNameToDatabaseStore,
    required this.supabase,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: authStateStore.authState,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            addNameToDatabaseStore.call(NoParams());
            Modular.to.navigate('/home/');
          }
          return PlatformScaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlatformElevatedButton(
                    child: const Text("Sign in With Apple"),
                    onPressed: () async =>
                        await authProviderStore.routeAuthProviderRequest(
                      AuthProvider.apple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PlatformElevatedButton(
                    child: const Text("Sign in With Google"),
                    onPressed: () async =>
                        await authProviderStore.routeAuthProviderRequest(
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
