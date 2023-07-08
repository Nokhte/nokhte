import 'package:supabase/supabase.dart';

import 'supabase_client_constants.dart';

class UserSetupConstants {
  static Future<List<String>> fetchUIDs() async {
    final supabase = SupabaseClientConfigConstants.supabase;
    await supabase.auth.signInWithPassword(
      email: 'test3@example.com',
      password: 'test123',
    );
    final thirdUserUID = supabase.auth.currentUser?.id ?? "";
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      email: 'test2@example.com',
      password: 'test123',
    );
    final secondUserUID = supabase.auth.currentUser?.id ?? "";
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      email: 'test@example.com',
      password: 'test123',
    );
    final firstUserUID = supabase.auth.currentUser?.id ?? "";
    await supabase.auth.signOut();
    return [firstUserUID, secondUserUID, thirdUserUID];
  }

  static Future<void> signInUser1({
    required SupabaseClient supabase,
  }) async {
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      email: 'test@example.com',
      password: 'test123',
    );
  }

  static Future<void> signInUser2({required SupabaseClient supabase}) async {
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      email: 'test2@example.com',
      password: 'test123',
    );
  }

  static Future<void> signInUser3({required SupabaseClient supabase}) async {
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      email: 'test3@example.com',
      password: 'test123',
    );
  }
}
