import 'package:flutter_modular/flutter_modular.dart';
import 'core/modules/supabase/supabase.dart';
import 'modules/home/home.dart';
import 'modules/login/login.dart';
import 'modules/session/session.dart';
import 'modules/session_starters/session_starters.dart';
import 'modules/storage/storage.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SupabaseModule(),
      ];

  @override
  void routes(r) {
    r.module('/', module: LoginModule());
    r.module('/home/', module: HomeModule());
    r.module('/session_starters/', module: SessionStartersModule());
    r.module('/session/', module: SessionModule());
    r.module('/storage', module: StorageModule());
  }
}
