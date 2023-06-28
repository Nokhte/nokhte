import 'package:supabase_flutter/supabase_flutter.dart';

class UsernameDataConstants {
  // static Map<String, String> get usernameCreationInput =>
  //     {"uid": "test-uid", "username": "tester"};
// ^^ Not needed since
  static List<Map<String, dynamic>> get usernameQueryResponse => [
        {"uid": "test-uid", "username": "test"}
      ];
  static PostgrestException get postgrestException => const PostgrestException(
        message:
            'new row violates row-level security policy for table "usernames"',
        code: '42501',
        details: 'Forbidden, hint: null',
      );
  static String get username => "test";
  static String get userEmail => "test@example.com";
  static List get emptyQueryResponse => [];
}
