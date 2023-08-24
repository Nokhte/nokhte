import 'package:primala_backend/phrase_components.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InitiateCollaboratorSearch {
  static Future<FunctionResponse> invoke({
    required SupabaseClient supabase,
    required String wayfarerUID,
    required CollaboratorPhraseIDs queryPhraseIDs,
  }) async {
    return await supabase.functions
        .invoke("initiate-collaborator-search", body: {
      'wayfarerUID': wayfarerUID,
      'queryAdjectiveID': queryPhraseIDs.adjectiveID,
      'queryNounID': queryPhraseIDs.nounID,
    });
  }
}
