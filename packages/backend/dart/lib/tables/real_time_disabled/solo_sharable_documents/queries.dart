import 'package:supabase_flutter/supabase_flutter.dart';

class SoloSharableDocuments {
  static Future<List> createSoloDoc({
    required SupabaseClient supabase,
    required String ownerUID,
    required String collaboratorUID,
    required String docType,
  }) async =>
      await supabase.from('solo_sharable_documents').insert({
        'owner_uid': ownerUID,
        'collaborator_uid': collaboratorUID,
        'doc_type': docType,
      }).select();

  static Future<List> fetchDocInfo({
    required SupabaseClient supabase,
    String ownerUID = '',
    String collaboratorUID = '',
  }) async {
    if (ownerUID.isEmpty && collaboratorUID.isEmpty) {
      throw ArgumentError(
          "You need either ownerUID or collaboratorUID to complete a query");
    }
    return await supabase
        .from('solo_sharable_documents')
        .select()
        .eq(
          ownerUID.isEmpty ? 'collaborator_uid' : 'owner_uid',
          ownerUID.isEmpty ? collaboratorUID : ownerUID,
        )
        .order(
          'created_at',
          ascending: false,
        )
        .limit(1);
  }

  static Future<List> updateDocContent({
    required SupabaseClient supabase,
    required String ownerUID,
    required String content,
  }) async =>
      await supabase
          .from('solo_sharable_documents')
          .update({
            'content': content,
          })
          .eq('owner_uid', ownerUID)
          .order(
            'created_at',
            ascending: false,
          )
          .limit(1)
          .select();

  static Future<List> updateDocVisibility({
    required SupabaseClient supabase,
    required String ownerUID,
    required bool visibility,
  }) async =>
      await supabase
          .from('solo_sharable_documents')
          .update({
            'is_visible_to_collaborator': visibility,
          })
          .eq('owner_uid', ownerUID)
          .order(
            'created_at',
            ascending: false,
          )
          .limit(1)
          .select();

  static Future<List> sealDocument({
    required SupabaseClient supabase,
    required String ownerUID,
  }) async =>
      await supabase
          .from('solo_sharable_documents')
          .update({
            'session_is_completed': true,
          })
          .eq('owner_uid', ownerUID)
          .order(
            'created_at',
            ascending: false,
          )
          .limit(1)
          .select();
}
