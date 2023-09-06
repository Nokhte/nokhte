import 'package:supabase_flutter/supabase_flutter.dart';

class FinishedCollaborativeP2PPurposeDocuments {
  static Future<List> fetchDocInfo({
    required SupabaseClient supabase,
    required String currentUserUID,
  }) async =>
      await supabase
          .from('finished_collaborative_p2p_purpose_documents')
          .select()
          .or(
            'collaborator_one_uid.eq.$currentUserUID,collaborator_two_uid.eq.$currentUserUID',
          );
  static Future<List> insertDoc({
    required SupabaseClient supabase,
    required String currentUserUID,
    required String collaboratorUserUID,
    required String content,
  }) async =>
      await supabase
          .from('finished_collaborative_p2p_purpose_documents')
          .insert({
        'collaborator_one_uid': currentUserUID,
        'collaborator_two_uid': collaboratorUserUID,
        'content': content,
      }).select();
}
