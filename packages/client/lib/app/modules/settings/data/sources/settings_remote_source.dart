import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SettingsRemoteSource {
  Future<void> logout();
}

class SettingsRemoteSourceImpl implements SettingsRemoteSource {
  final SupabaseClient supabase;

  SettingsRemoteSourceImpl({required this.supabase});

  @override
  logout() async {
    return await supabase.auth.signOut();
  }
}
