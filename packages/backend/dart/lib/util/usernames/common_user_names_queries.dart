import 'package:supabase_flutter/supabase_flutter.dart';

class CommonUserNamesQueries {
  static Future<dynamic> insertUserInfo({
    required SupabaseClient supabase,
    required String? userUID,
    required String firstName,
    required String lastName,
  }) async {
    return await supabase.from('user_names').insert({
      "uid": userUID,
      "first_name": firstName,
      "last_name": lastName,
    }).select();
  }

  static Future<dynamic> fetchUserInfo({
    required SupabaseClient supabase,
    required String? userUID,
  }) async {
    return await supabase.from('user_names').select().eq(
          'uid',
          userUID,
        );
  }

  static Future<dynamic> deleteCollaboratorPhraseInfo(
      {required SupabaseClient supabase, required String? userUID}) async {
    return await supabase
        .from(
          'collaborator_phrases',
        )
        .delete()
        .eq(
          'uid',
          userUID,
        );
  }

  static Future<dynamic> deleteUserInfo({
    required SupabaseClient supabase,
    required String? userUID,
  }) async {
    return await supabase
        .from('user_names')
        .delete()
        .eq(
          'uid',
          userUID,
        )
        .select();
  }
}
