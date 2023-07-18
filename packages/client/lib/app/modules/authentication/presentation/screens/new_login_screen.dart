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
