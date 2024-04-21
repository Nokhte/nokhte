import 'package:nokhte/app/core/guards/auth_guard.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'login.dart';
export 'data/data.dart';
export 'domain/domain.dart';
export 'presentation/presentation.dart';
export 'types/types.dart';
export 'login_widgets_module.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [
        LoginWidgetsModule(),
        PosthogModule(),
        LegacyConnectivityModule(),
      ];

  @override
  binds(i) {
    i.add<LoginRemoteSourceImpl>(
      () => LoginRemoteSourceImpl(
        supabase: Modular.get<SupabaseClient>(),
      ),
    );
    i.add<LoginContractImpl>(
      () => LoginContractImpl(
        remoteSource: i<LoginRemoteSourceImpl>(),
        networkInfo: Modular.get<NetworkInfoImpl>(),
      ),
    );
    i.add<AddName>(
      () => AddName(
        contract: i.get<LoginContractImpl>(),
      ),
    );
    i.add<AuthGetUserInfo>(
      () => AuthGetUserInfo(
        contract: i.get<LoginContractImpl>(),
      ),
    );
    i.add<GetLoginState>(
      () => GetLoginState(
        contract: i.get<LoginContractImpl>(),
      ),
    );
    i.add<SignInWithApple>(
      () => SignInWithApple(
        contract: i.get<LoginContractImpl>(),
      ),
    );
    i.add<SignInWithGoogle>(
      () => SignInWithGoogle(
        contract: i.get<LoginContractImpl>(),
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
    i.add<GetLoginStateStore>(
      () => GetLoginStateStore(
        logic: i<GetLoginState>(),
      ),
    );
    i.add<LoginScreenCoordinator>(
      () => LoginScreenCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        tap: TapDetector(),
        swipe: SwipeDetector(),
        addName: Modular.get<AddName>(),
        widgets: Modular.get<LoginScreenWidgetsCoordinator>(),
        signInWithAuthProvider: i<SignInWithAuthProviderStore>(),
        authStateStore: i<GetLoginStateStore>(),
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
