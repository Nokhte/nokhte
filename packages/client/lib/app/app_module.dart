import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/network/network_info.dart';
import 'package:nokhte/app/modules/authentication/authentication_module.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_module.dart';
import 'package:nokhte/app/modules/purpose_session/purpose_session_module.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  final SupabaseClient supabase;
  final Connectivity connectivityInstance;

  AppModule({required this.supabase, required this.connectivityInstance});

  @override
  List<Module> get imports => [
        LegacyConnectivityModule(connectivityInstance: connectivityInstance),
      ];

  @override
  void binds(i) {
    i.addSingleton(() => supabase);
    i.addSingleton(() => NetworkInfoImpl(connectivityInstance));
  }

  @override
  void routes(r) {
    r.module('/', module: AuthenticationModule());
    r.module('/home/', module: HomeModule());
    r.module('/collaboration/', module: CollaborationModule());
    r.module('/purpose_session', module: PurposeSessionModule());
  }
}
