// ***************************************************
// * PRIMALA IMPORTS
///   * DATA Layer Imports
//        * Sources Imports
import 'package:primala/app/modules/authentication/data/sources/auth_remote_source.dart';
//        * Model Imports
//        * Contract Implementation Import
import 'package:primala/app/modules/authentication/data/contracts/authentication_contract_impl.dart';
//   * DOMAIN Layer Imports
//          * Contract Interfaces
import 'package:primala/app/modules/authentication/domain/contracts/authentication_contract.dart';
import 'package:primala/app/modules/authentication/domain/logic/add_name_to_database.dart';
//          * Logic
import 'package:primala/app/modules/authentication/domain/logic/get_auth_state.dart';
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_apple.dart';
import 'package:primala/app/modules/authentication/domain/logic/sign_in_with_google.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/add_name_to_database_getter_store.dart';
//          * Entities
///   * Presentation Layer Imports
//          * MobX
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_provider_getter_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/getters/get_auth_state_getter_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/add_name_to_database_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_provider_store.dart';
import 'package:primala/app/modules/authentication/presentation/mobx/main/auth_state_store.dart';
//          * Views
import 'package:primala/app/modules/authentication/presentation/screens/login_screen.dart';
// * 3rd Parties
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
//    * Core Imports
import 'package:primala/app/core/network/network_info.dart';
//          * Guard Import
import 'package:primala/app/core/guards/auth_guard.dart';
// ***************************************************

class AuthenticationModule extends Module {
  @override
  List<Bind> get binds => [
        // & Data Source
        Bind.singleton<AuthenticationRemoteSourceImpl>(
          (i) => AuthenticationRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        // & Contract Implementation
        Bind.singleton<AuthenticationContractImpl>(
          (i) => AuthenticationContractImpl(
            remoteSource: i<AuthenticationRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfoImpl>(),
          ),
        ),
        // & Logic
        Bind.singleton<AddNameToDatabase>(
          (i) => AddNameToDatabase(
            contract: i<AuthenticationContract>(),
          ),
        ),
        Bind.singleton<GetAuthState>(
            (i) => GetAuthState(contract: i<AuthenticationContract>())),
        Bind.singleton<SignInWithApple>(
            (i) => SignInWithApple(contract: i<AuthenticationContract>())),
        Bind.singleton<SignInWithGoogle>(
            (i) => SignInWithGoogle(contract: i<AuthenticationContract>())),
        // & MobX Getter Stores
        Bind.singleton<AddNameToDatabaseGetterStore>(
          (i) => AddNameToDatabaseGetterStore(
            addNameLogic: i<AddNameToDatabase>(),
          ),
        ),
        Bind.singleton<GetAuthStateStore>(
            (i) => GetAuthStateStore(i<GetAuthState>())),
        Bind.singleton<GetAuthProviderStateStore>(
          (i) => GetAuthProviderStateStore(
            apple: i<SignInWithApple>(),
            google: i<SignInWithGoogle>(),
          ),
        ),
        // & Mobx Mother Stores
        Bind.singleton<AddNameToDatabaseStore>(
          (i) => AddNameToDatabaseStore(
            addNameGetterStore: i<AddNameToDatabaseGetterStore>(),
          ),
        ),
        Bind.singleton<AuthProviderStore>(
          (i) => AuthProviderStore(
            authProviderGetterStore: i<GetAuthProviderStateStore>(),
          ),
        ),
        Bind.singleton<AuthStateStore>(
          (i) => AuthStateStore(
            authStateGetterStore: i<GetAuthStateStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => LoginScreen(
            authStateStore: Modular.get<AuthStateStore>(),
            addNameToDatabaseStore: Modular.get<AddNameToDatabaseStore>(),
            authProviderStore: Modular.get<AuthProviderStore>(),
            supabase: Modular.get<SupabaseClient>(),
          ),
          guards: [
            AuthGuard(
              supabase: Modular.get<SupabaseClient>(),
            ),
          ],
        )
      ];
}
