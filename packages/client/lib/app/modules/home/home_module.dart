import 'package:flutter_modular/flutter_modular.dart';
import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:primala/app/modules/home/presentation/screens/home_screen.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<SupabaseClient>(
          (i) => Modular.get<SupabaseClient>(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => HomeScreen(
            // supabase: Modular.get<SupabaseClient>(),
          ),
        )
      ];
}
