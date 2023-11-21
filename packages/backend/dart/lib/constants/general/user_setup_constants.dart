import 'package:nokhte_backend/constants/general/user_data_constants.dart';
import 'package:nokhte_backend/constants/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'sign_in.dart';
import 'supabase_client_constants.dart';

class UserSetupConstants {
  static Future<List<String>> getUIDs() async {
    final supabase = SupabaseClientConfigConstants.supabase;
    final List<String> userUIDs = [];
    try {
      for (var i = 0; i < 3; i++) {
        final email = 'test${i + 1}@example.com';
        await supabase.auth.signUp(
          email: email,
          password: UserDataConstants.universalPassword,
        );
        userUIDs.add(supabase.auth.currentUser?.id ?? '');
        await supabase.auth.signOut();
      }
    } catch (e) {
      for (var i = 0; i < 3; i++) {
        final email = 'test${i + 1}@example.com';
        await supabase.auth.signInWithPassword(
          email: email,
          password: UserDataConstants.universalPassword,
        );
        userUIDs.add(supabase.auth.currentUser?.id ?? '');
        await supabase.auth.signOut();
      }
    }
    return userUIDs;
  }

  static Future<void> wipeUsernamesTable({
    required SupabaseClient supabaseAdmin,
  }) async {
    final userUIDs = await getUIDs();
    for (var userUID in userUIDs) {
      await supabaseAdmin.from('user_names').delete().eq(
            'uid',
            userUID,
          );
      await supabaseAdmin.from('collaborator_phrases').delete().eq(
            'uid',
            userUID,
          );
    }
  }

  static Future<void> setUpUserNamesTableForSubsequentTests(
      {required SupabaseClient supabase}) async {
    final userUIDs = await getUIDs();
    for (var i = 0; i < userUIDs.length; i++) {
      await SignIn.callbackList(supabase: supabase)[i]();
      await supabase.from('user_names').insert(
        {
          "uid": userUIDs[i],
          "first_name": UserDataConstants.usersData[i]['firstName'],
          "last_name": UserDataConstants.usersData[i]['lastName'],
        },
      );
    }
  }

  static Future<List<CollaboratorPhraseIDs>> getCollaboratorPhraseIDs(
      {required SupabaseClient supabaseAdmin}) async {
    final List<CollaboratorPhraseIDs> phraseIDs = [];
    final userUIDs = await getUIDs();
    for (var userUID in userUIDs) {
      final collaboratorPhraseRes = await supabaseAdmin
          .from('collaborator_phrases')
          .select()
          .eq('uid', userUID);
      phraseIDs.add(CollaboratorPhraseIDs(
        adjectiveID: collaboratorPhraseRes.first["adjective_id"],
        nounID: collaboratorPhraseRes.first["noun_id"],
      ));
    }
    return phraseIDs;
  }
}
