// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:primala/app/core/canvas_widget_utils/interaction_type.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/add_name_to_database_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_provider_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_state_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/modules/authentication/presentation/widgets/animated_beach/animated_beach.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: authStateStore.authState,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            addNameToDatabaseStore.call(NoParams());
            Modular.to.navigate('/home/');
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const AnimatedBeach(
              interactionType: BeachInteractionType.none,
            ),
          );
        });
  }
}
