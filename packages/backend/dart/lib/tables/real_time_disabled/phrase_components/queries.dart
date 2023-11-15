import 'package:supabase_flutter/supabase_flutter.dart';

class PhraseComponentsQueries {
  static Future<dynamic> checkIfAdjectiveExists({
    required SupabaseClient supabase,
    required String queryAdjective,
  }) async {
    return await supabase
        .from("phrase_components")
        .select()
        .eq('adjective', queryAdjective);
  }

  static Future<dynamic> checkIfNounExists({
    required SupabaseClient supabase,
    required String queryNoun,
  }) async {
    return await supabase
        .from("phrase_components")
        .select()
        .eq('noun', queryNoun);
  }
}
