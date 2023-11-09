import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/authentication/authentication_module.dart';
import 'package:nokhte/app/modules/collective_session/collective_session_module.dart';
import 'package:nokhte/app/modules/home/home_module.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nokhte/app/modules/individual_session/individual_session_module.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/p2p_collaborator_pool_module.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/p2p_perspectives_session_module.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/p2p_purpose_session_module.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppModule extends Module {
  final SupabaseClient supabase;
  final Connectivity connectivityInstance;

  AppModule({required this.supabase, required this.connectivityInstance});

  /// List of module imports.
  @override
  List<Module> get imports => [
        ConnectivityModule(connectivityInstance: connectivityInstance),
      ];

  /// List of the global dependency injections (binds).
  @override
  List<Bind> get binds => [
        Bind.singleton<SupabaseClient>((i) => supabase),
        Bind.singleton<NetworkInfoImpl>(
          (i) => NetworkInfoImpl(connectivityInstance),
        )
      ];

  /// List of routes for navigation within the app.
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          // '/',
          '/auth/',
          module: AuthenticationModule(),
        ),
        ModuleRoute(
          '/home/',
          module: HomeModule(),
        ),
        ModuleRoute(
          '/p2p_collaborator_pool/',
          module: P2PCollaboratorPoolModule(),
        ),
        ModuleRoute(
          '/p2p_purpose_session/',
          module: P2PCollaboratorSessionModule(),
        ),
        ModuleRoute(
          // '/',
          '/p2p_perspective_session/',
          module: P2PPerspectivesSessionModule(),
        ),
        ModuleRoute(
          '/individual_session/',
          // '/',
          module: IndividualSessionModule(),
        ),
        ModuleRoute(
          // '/collective_session/',
          '/',
          module: CollectiveSessionModule(),
        ),
      ];
}
