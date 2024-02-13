import 'package:nokhte/app/core/guards/auth_guard.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_modules/widget_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/authentication_widgets_module.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/modules/authentication/data/data.dart';
import 'package:nokhte/app/modules/authentication/domain/logic/auth_get_user_info.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [
        AuthenticationWidgetsModule(),
        GesturesModule(),
        LegacyConnectivityModule(),
      ];

  @override
  binds(i) {
    i.add<AuthenticationRemoteSourceImpl>(
      () => AuthenticationRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<AuthenticationContractImpl>(
      () => AuthenticationContractImpl(
        remoteSource: i<AuthenticationRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<AddName>(
      () => AddName(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.add<AuthGetUserInfo>(
      () => AuthGetUserInfo(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.add<GetAuthState>(
      () => GetAuthState(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.add<SignInWithApple>(
      () => SignInWithApple(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.add<SignInWithGoogle>(
      () => SignInWithGoogle(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.add<GetUserInfoStore>(
      () => GetUserInfoStore(
        logic: i<AuthGetUserInfo>(),
      ),
    );
    i.add<SignInWithAuthProviderStore>(
      () => SignInWithAuthProviderStore(
        signInWithApple: i.get<SignInWithApple>(),
        signInWithGoogle: i.get<SignInWithGoogle>(),
      ),
    );
    i.add<GetAuthStateStore>(
      () => GetAuthStateStore(
        logic: i<GetAuthState>(),
      ),
    );
    i.add<LoginScreenCoordinator>(
      () => LoginScreenCoordinator(
        getUserInfo: Modular.get<GetUserInfoStore>(),
        tap: Modular.get<TapDetector>(),
        swipe: Modular.get<SwipeDetector>(),
        addName: Modular.get<AddName>(),
        widgets: Modular.get<LoginScreenWidgetsCoordinator>(),
        signInWithAuthProvider: i<SignInWithAuthProviderStore>(),
        authStateStore: i<GetAuthStateStore>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      '/',
      child: (context) => LoginScreen(
        coordinator: Modular.get<LoginScreenCoordinator>(),
      ),
      guards: [
        AuthGuard(
          supabase: Modular.get<SupabaseClient>(),
        ),
      ],
    );
  }
}
