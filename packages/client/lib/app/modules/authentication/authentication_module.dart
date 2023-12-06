import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/modules/authentication/data/data.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';
// import 'package:nokhte/app/core/guards/auth_guard.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [
        BeachWavesModule(),
        GesturesModule(),
      ];
  @override
  List<Bind> get binds => [
        Bind.singleton<AuthenticationRemoteSourceImpl>(
          (i) => AuthenticationRemoteSourceImpl(
            supabase: Modular.get<SupabaseClient>(),
          ),
        ),
        Bind.singleton<AuthenticationContractImpl>(
          (i) => AuthenticationContractImpl(
            remoteSource: i<AuthenticationRemoteSourceImpl>(),
            networkInfo: Modular.get<NetworkInfoImpl>(),
          ),
        ),
        Bind.singleton<GetAuthState>(
            (i) => GetAuthState(contract: i<AuthenticationContract>())),
        Bind.singleton<SignInWithApple>(
            (i) => SignInWithApple(contract: i<AuthenticationContract>())),
        Bind.singleton<SignInWithGoogle>(
            (i) => SignInWithGoogle(contract: i<AuthenticationContract>())),
        Bind.singleton<GetAuthStateGetterStore>(
            (i) => GetAuthStateGetterStore(i<GetAuthState>())),
        Bind.singleton<GetAuthProviderStateGetterStore>(
          (i) => GetAuthProviderStateGetterStore(
            apple: i<SignInWithApple>(),
            google: i<SignInWithGoogle>(),
          ),
        ),
        Bind.singleton<GesturePillStore>(
          (i) => GesturePillStore(
            endingPath: SvgAnimtionConstants.circlePath,
          ),
        ),
        Bind.singleton<SmartTextStore>(
          (i) => SmartTextStore(),
        ),
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
        Bind.singleton<LoginScreenCoordinatorStore>(
          (i) => LoginScreenCoordinatorStore(
            tap: Modular.get<TapDetector>(),
            smartTextStore: i<SmartTextStore>(),
            beachWaves: Modular.get<BeachWavesStore>(),
            swipe: Modular.get<SwipeDetector>(),
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
            coordinator: Modular.get<LoginScreenCoordinatorStore>(),
          ),
          // guards: [
          // AuthGuard(
          //   supabase: Modular.get<SupabaseClient>(),
          // ),
          // ],
          transition: TransitionType.noTransition,
        )
      ];
}
