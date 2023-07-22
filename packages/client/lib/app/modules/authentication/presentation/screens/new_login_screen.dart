/// new_login_screen.dart
///
/// Author: Sonny Vesali
///
/// This file defines the [NewLoginScreen] widget, which serves as a login screen
/// that allows platform-specific sign-in with Apple for iOS devices and Google for
/// Android devices. The login screen uses [Swipe] to initiate the authentication
/// process when the user swipes up on the screen.
///
/// [NewLoginScreen] extends [StatefulWidget] and receives several stores and a Supabase
/// client as constructor parameters. The stores include [AuthProviderStore],
/// [AuthStateStore], and [AddNameToDatabaseStore], which handle authentication
/// provider selection, authentication state management, and adding user information
/// to the database, respectively.
///
/// The [NewLoginScreen] widget listens to the [authStateStore.authState] stream. If the
/// stream data becomes true, indicating that the user is authenticated, it calls the
/// [addNameToDatabaseStore.call(NoParams())] method and navigates to the home screen.
///
/// The UI of the [NewLoginScreen] contains two main components:
///   1. A backdrop animation of water using the [WaterAnimation] widget, which adds
///      an interactive and visually appealing effect to the login screen.
///   2. A text prompt appearing at the bottom of the screen, guiding the user to swipe
///      up to log in with either Apple or Google, depending on the platform.
///
/// Note: The ignore_for_file directive is used to suppress warnings about logic
/// being present in the createState method.

// ignore_for_file: no_logic_in_create_state

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/interfaces/auth_providers.dart';
import 'dart:io';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/add_name_to_database_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_provider_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_state_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/water_animation.dart';
import 'package:swipe/swipe.dart';

class NewLoginScreen extends StatefulWidget {
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final SupabaseClient supabase;
  final AddNameToDatabaseStore addNameToDatabaseStore;
  const NewLoginScreen({
    Key? key,
    required this.authProviderStore,
    required this.authStateStore,
    required this.supabase,
    required this.addNameToDatabaseStore,
  }) : super(key: key);
  @override
  State<NewLoginScreen> createState() => _NewLoginScreenState(
        addNameToDatabaseStore: addNameToDatabaseStore,
        authProviderStore: authProviderStore,
        authStateStore: authStateStore,
        supabase: supabase,
      );
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final AuthProviderStore authProviderStore;
  final AuthStateStore authStateStore;
  final SupabaseClient supabase;
  final AddNameToDatabaseStore addNameToDatabaseStore;

  _NewLoginScreenState({
    required this.authProviderStore,
    required this.authStateStore,
    required this.addNameToDatabaseStore,
    required this.supabase,
  });

  bool showText = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Platform.isAndroid ? AuthProvider.google : AuthProvider.apple;
    if (kDebugMode) {
      authProvider = AuthProvider.google;
    }
    return StreamBuilder<bool>(
        stream: authStateStore.authState,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            addNameToDatabaseStore.call(NoParams());
            Modular.to.navigate('/home/');
          }
          return PlatformScaffold(
            body: Stack(
              children: [
                Swipe(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const WaterAnimation()),
                  onSwipeUp: () async {
                    await authProviderStore
                        .routeAuthProviderRequest(authProvider);
                  },
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(30.0),
                  child: AnimatedOpacity(
                    opacity: showText ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: PlatformText(
                        "Swipe to Log In with ${authProvider.name[0].toUpperCase() + authProvider.name.substring(1)}"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
