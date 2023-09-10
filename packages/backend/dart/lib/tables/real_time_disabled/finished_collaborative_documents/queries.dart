import 'package:supabase_flutter/supabase_flutter.dart';

class FinishedCollaborativeP2PPurposeDocuments {
  static Future<List> fetchDocInfo({
    required SupabaseClient supabase,
    required String currentUserUID,
    required String docType,
  }) async =>
      await supabase
          .from('finished_collaborative_p2p_purpose_documents')
          .select()
          .or(
            'collaborator_one_uid.eq.$currentUserUID,collaborator_two_uid.eq.$currentUserUID',
          )
          .eq('doc_type', docType)
          .order(
            'created_at',
            ascending: false,
          )
          .limit(1);
  static Future<List> insertDoc({
    required SupabaseClient supabase,
    required String currentUserUID,
    required String collaboratorUserUID,
    required String docType,
    required String content,
  }) async =>
      await supabase
          .from('finished_collaborative_p2p_purpose_documents')
          .insert({
        'collaborator_one_uid': currentUserUID,
        'collaborator_two_uid': collaboratorUserUID,
        'doc_type': docType,
        'content': content,
      }).select();
}
