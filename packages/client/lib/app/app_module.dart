import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session_module.dart';
import 'core/modules/supabase/supabase_module.dart';
import 'modules/authentication/authentication_module.dart';
import 'modules/collaboration/collaboration_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
      ];

  @override
  void routes(r) {
    r.module('/', module: AuthenticationModule());
    r.module('/home/', module: HomeModule());
    r.module('/collaboration/', module: CollaborationModule());
    r.module('/irl_nokhte_session/', module: IrlNokhteSessionModule());
  }
}
