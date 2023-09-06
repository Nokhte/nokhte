import 'package:primala/app/modules/authentication/domain/domain.dart';
import 'package:primala/app/modules/authentication/data/data.dart';
import 'package:primala/app/modules/authentication/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/core/guards/auth_guard.dart';

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
        Bind.singleton<GetAuthState>(
            (i) => GetAuthState(contract: i<AuthenticationContract>())),
        Bind.singleton<SignInWithApple>(
            (i) => SignInWithApple(contract: i<AuthenticationContract>())),
        Bind.singleton<SignInWithGoogle>(
            (i) => SignInWithGoogle(contract: i<AuthenticationContract>())),
        // & MobX Getter Stores
        Bind.singleton<GetAuthStateGetterStore>(
            (i) => GetAuthStateGetterStore(i<GetAuthState>())),
        Bind.singleton<GetAuthProviderStateGetterStore>(
          (i) => GetAuthProviderStateGetterStore(
            apple: i<SignInWithApple>(),
            google: i<SignInWithGoogle>(),
          ),
        ),
        // & Mobx Mother Stores
        Bind.singleton<AuthProviderStore>(
          (i) => AuthProviderStore(
            authProviderGetterStore: i<GetAuthProviderStateGetterStore>(),
          ),
        ),
        Bind.singleton<AuthStateStore>(
          (i) => AuthStateStore(
            authStateGetterStore: i<GetAuthStateGetterStore>(),
          ),
        ),
        // & Coordinator Stores
        Bind.singleton<LoginScreenCoordinatorStore>(
          (i) => LoginScreenCoordinatorStore(
            authProviderStore: i<AuthProviderStore>(),
            authStateStore: i<AuthStateStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => LoginScreen(
            loginCoordinatorStore: Modular.get<LoginScreenCoordinatorStore>(),
          ),
          guards: [
            AuthGuard(
              supabase: Modular.get<SupabaseClient>(),
            ),
          ],
        )
      ];
}
