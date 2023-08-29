/// app_module.dart
///
/// This file defines the [AppModule] class, which is a main app module in the
/// Flutter Modular architecture. It is responsible for defining the dependency
/// injection configuration, routes, and imports for the entire application.
///
/// The [AppModule] requires a [SupabaseClient] and a [Connectivity] instance
/// for proper functioning. It includes the [ConnectivityModule] as an import,
/// which handles connectivity-related dependencies and configurations.
///
/// The [AppModule] provides bindings for the [SupabaseClient] and
/// [NetworkInfoImpl], which are injected into the application using the
/// dependency injection system. The [SupabaseClient] is a singleton, and the
/// [NetworkInfoImpl] is bound as a singleton with [Connectivity] as a
/// constructor parameter.
/// The routes defined in this module are '/home/' and '/', which are mapped to
/// the [AuthenticationModule] and [HomeModule], respectively.

import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/modules/connectivity/connectivity_module.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/authentication/authentication_module.dart';
import 'package:primala/app/modules/home/home_module.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/p2p_collaborator_pool_module.dart';
import 'package:primala/app/modules/p2p_purpose_session/p2p_purpose_session_module.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// The main app module that configures the dependency injection, routes, and
/// imports.
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
          '/',
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
      ];
}
