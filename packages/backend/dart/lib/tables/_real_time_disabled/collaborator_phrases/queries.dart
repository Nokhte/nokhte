import 'package:supabase_flutter/supabase_flutter.dart';

class CollaboratorPhraseQueries {
  final SupabaseClient supabase;
  final String userUID;

  CollaboratorPhraseQueries({
    required this.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? "";

  Future<dynamic> getUserInfo() async {
    return await supabase
        .from('collaborator_phrases')
        .select()
        .eq('uid', userUID);
  }
}
