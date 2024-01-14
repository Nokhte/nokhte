import 'package:flutter_modular/flutter_modular.dart';
import 'core/modules/supabase/supabase_module.dart';
import 'modules/authentication/authentication_module.dart';
import 'modules/collaboration/collaboration_module.dart';
import 'modules/purpose_session/purpose_session_module.dart';
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
    r.module('/purpose_session/', module: PurposeSessionModule());
  }
}
