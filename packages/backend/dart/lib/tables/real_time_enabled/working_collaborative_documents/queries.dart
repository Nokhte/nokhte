import 'package:primala_backend/solo_sharable_documents.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WorkingCollaborativeDocumentsQueries {
  static Future<List> createCollaborativeDocument({
    required SupabaseClient supabase,
    required String currentUserUID,
    required String docType,
  }) async {
    final collaboratorInfoRes =
        await ExistingCollaborationsQueries.fetchCollaboratorsUIDAndNumber(
      supabase: supabase,
      currentUserUID: currentUserUID,
    );
    final collaboratorOneUID =
        collaboratorInfoRes[1] == 1 ? collaboratorInfoRes[0] : currentUserUID;
    final collaboratorTwoUID =
        collaboratorInfoRes[1] == 2 ? collaboratorInfoRes[0] : currentUserUID;
    return await supabase.from('working_collaborative_documents').insert({
      'collaborator_one_uid': collaboratorOneUID,
      'collaborator_two_uid': collaboratorTwoUID,
      'doc_type': docType,
    }).select();
  }
}
