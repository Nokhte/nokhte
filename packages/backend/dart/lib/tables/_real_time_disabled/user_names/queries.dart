import 'package:supabase_flutter/supabase_flutter.dart';

class UserNamesQueries {
  final SupabaseClient supabase;
  String userUID;

  UserNamesQueries({
    required this.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> insertUserInfo({
    required String firstName,
    required String lastName,
  }) async =>
      await supabase.from('user_names').insert({
        "uid": userUID,
        "first_name": firstName,
        "last_name": lastName,
      }).select();

  Future<List> getUserInfo() async =>
      await supabase.from('user_names').select().eq(
            'uid',
            userUID,
          );

  Future<List> getCollaboratorPhraseInfo() async =>
      await supabase.from('collaborator_phrases').select().eq('uid', userUID);

  Future<void> deleteCollaboratorPhraseInfo() async =>
      await supabase.from('collaborator_phrases').delete().eq('uid', userUID);

  Future<List> deleteUserInfo() async =>
      await supabase.from('user_names').delete().eq('uid', userUID).select();
}
