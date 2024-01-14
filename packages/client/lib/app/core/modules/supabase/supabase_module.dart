import 'package:flutter_modular/flutter_modular.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<SupabaseClient>(
      () => Supabase.instance.client,
    );
  }
}
