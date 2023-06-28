import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/core/modules/connectivity/connectivity_module.dart';
import 'package:primala/app/core/network/network_info.dart';
import 'package:primala/app/modules/authentication/authentication_module.dart';
import 'package:primala/app/modules/home/home_module.dart';
import 'package:primala/app/modules/p2p_request_sender/p2p_request_sender_module.dart';
import 'package:primala/app/modules/p2p_scheduling_sender/p2p_scheduling_sender_module.dart';
import 'package:primala/app/modules/username/username_module.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppModule extends Module {
  final SupabaseClient supabase;
  final Connectivity connectivityInstance;

  AppModule({required this.supabase, required this.connectivityInstance});

  @override
  List<Module> get imports => [
        ConnectivityModule(connectivityInstance: connectivityInstance),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton<SupabaseClient>((i) => supabase),
        Bind.singleton<NetworkInfoImpl>(
          (i) => NetworkInfoImpl(connectivityInstance),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthenticationModule(),
        ),
        ModuleRoute(
          '/username/',
          module: UsernameModule(),
        ),
        // TODO change back later
        // ModuleRoute(
        //   '/home/',
        //   module: HomeModule(),
        // ),
        ModuleRoute(
          '/send-request/',
          module: P2PRequestSenderModule(),
        ),
        ModuleRoute(
          '/home/',
          // '/send-scheduling-request/',
          // ^^ Add back in prod
          module: P2PSchedulingSenderModule(),
        )
      ];
}
// TODO: MAKE SURE U TEST & IMPLEMENT ROUTING