import 'package:supabase_flutter/supabase_flutter.dart';

class SignIn {
  static Future<void> user1({
    required SupabaseClient supabase,
  }) async {
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      phone: '9876543211',
      password: 'test123',
    );
  }

  static Future<void> user2({required SupabaseClient supabase}) async {
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      phone: '9876543212',
      password: 'test123',
    );
  }

  static Future<void> user3({required SupabaseClient supabase}) async {
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      phone: '9876543213',
      password: 'test123',
    );
  }

  static Future<void> user4({required SupabaseClient supabase}) async {
    await supabase.auth.signOut();
    await supabase.auth.signInWithPassword(
      phone: '9876543214',
      password: 'test123',
    );
  }

  static List<Function> callbackList({required SupabaseClient supabase}) {
    return [
      () async => await SignIn.user1(supabase: supabase),
      () async => await SignIn.user2(supabase: supabase),
      () async => await SignIn.user3(supabase: supabase),
      () async => await SignIn.user4(supabase: supabase),
    ];
  }
}
