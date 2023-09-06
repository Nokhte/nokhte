import 'package:supabase_flutter/supabase_flutter.dart';

class ExistingCollaborationsQueries {
  static Future<List<dynamic>> fetchCollaborationInfo({
    required SupabaseClient supabase,
    required String currentUserUID,
  }) async {
    return await supabase.from("existing_collaborations").select().or(
        'collaborator_one.eq.$currentUserUID,collaborator_two.eq.$currentUserUID');
  }
}
