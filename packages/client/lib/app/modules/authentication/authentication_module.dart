import 'package:nokhte/app/core/widgets/widget_modules/widget_modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/authentication_widgets_module.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/modules/authentication/data/data.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [
        AuthenticationWidgetsModule(),
        GesturesModule(),
      ];

  @override
  binds(i) {
    i.addSingleton<AuthenticationRemoteSourceImpl>(
      () => AuthenticationRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.addSingleton<AuthenticationContractImpl>(
      () => AuthenticationContractImpl(
        remoteSource: i<AuthenticationRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.addSingleton<GetAuthState>(
      () => GetAuthState(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.addSingleton<SignInWithApple>(
      () => SignInWithApple(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.addSingleton<SignInWithGoogle>(
      () => SignInWithGoogle(
        contract: i.get<AuthenticationContractImpl>(),
      ),
    );
    i.addSingleton<SignInWithAuthProviderStore>(
      () => SignInWithAuthProviderStore(
        signInWithApple: i.get<SignInWithApple>(),
        signInWithGoogle: i.get<SignInWithGoogle>(),
      ),
    );
    i.addSingleton<GetAuthStateStore>(
      () => GetAuthStateStore(
        logic: i<GetAuthState>(),
      ),
    );
    i.addSingleton<LoginScreenCoordinator>(
      () => LoginScreenCoordinator(
        tap: Modular.get<TapDetector>(),
        swipe: Modular.get<SwipeDetector>(),
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
    );
  }
}
