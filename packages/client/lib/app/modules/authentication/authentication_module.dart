import 'package:nokhte/app/core/widgets/module.dart';
import 'package:nokhte/app/core/widgets/shared/constants/svg_animation_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/authentication/domain/domain.dart';
import 'package:nokhte/app/modules/authentication/data/data.dart';
import 'package:nokhte/app/modules/authentication/presentation/presentation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/network/network_info.dart';

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
        Bind.singleton<GesturePillStore>(
          (i) => GesturePillStore(
            endingPath: SvgAnimtionConstants.circlePath,
          ),
        ),
        Bind.singleton<NokhteStore>(
          (i) => NokhteStore(),
        ),
        Bind.singleton<SmartTextStore>(
          (i) => SmartTextStore(),
        ),
        Bind.singleton<SignInWithAuthProviderStore>(
          (i) => SignInWithAuthProviderStore(
            signInWithApple: i<SignInWithApple>(),
            signInWithGoogle: i<SignInWithGoogle>(),
          ),
        ),
        Bind.singleton<GetAuthStateStore>(
          (i) => GetAuthStateStore(
            logic: i<GetAuthState>(),
          ),
        ),
        Bind.singleton<LoginScreenCoordinator>(
          (i) => LoginScreenCoordinator(
            nokhte: i<NokhteStore>(),
            tap: Modular.get<TapDetector>(),
            smartTextStore: i<SmartTextStore>(),
            beachWaves: Modular.get<BeachWavesStore>(),
            swipe: Modular.get<SwipeDetector>(),
            signInWithAuthProvider: i<SignInWithAuthProviderStore>(),
            authStateStore: i<GetAuthStateStore>(),
          ),
        ),
      ];

  @override
  List<ChildRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => LoginScreen(
            coordinator: Modular.get<LoginScreenCoordinator>(),
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
