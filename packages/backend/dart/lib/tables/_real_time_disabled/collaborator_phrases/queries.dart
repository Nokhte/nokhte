import 'package:supabase_flutter/supabase_flutter.dart';

class CollaboratorPhraseQueries {
  static Future<dynamic> getUserInfo(
      {required SupabaseClient supabase, required String? userUID}) async {
    return await supabase
        .from('collaborator_phrases')
        .select()
        .eq('uid', userUID);
  }
}
