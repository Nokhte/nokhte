import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/authentication/authentication_module.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_module.dart';
import 'package:nokhte/app/modules/purpose_session/purpose_session_module.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  final SupabaseClient supabase;

  AppModule({required this.supabase});

  @override
  void binds(i) {
    i.addSingleton(() => supabase);
  }

  @override
  void routes(r) {
    r.module('/', module: AuthenticationModule());
    r.module('/home/', module: HomeModule());
    r.module('/collaboration/', module: CollaborationModule());
    r.module('/purpose_session/', module: PurposeSessionModule());
  }
}
