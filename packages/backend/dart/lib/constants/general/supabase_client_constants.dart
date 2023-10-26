import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_config_constants.dart';

class SupabaseClientConfigConstants {
  static SupabaseClient get supabase => SupabaseClient(
        SupabaseConfigConstants.apiUrl,
        SupabaseConfigConstants.anonKey,
      );
  static SupabaseClient get supabaseAdmin => SupabaseClient(
        SupabaseConfigConstants.apiUrl,
        SupabaseConfigConstants.adminKey,
      );
}
