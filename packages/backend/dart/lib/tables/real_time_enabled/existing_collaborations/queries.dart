import 'package:supabase_flutter/supabase_flutter.dart';

class ExistingCollaborationsQueries {
  static Future<List<dynamic>> fetchCollaborationInfo({
    required SupabaseClient supabase,
    required String currentUserUID,
  }) async {
    return await supabase.from("existing_collaborations").select().or(
        'collaborator_one.eq.$currentUserUID,collaborator_two.eq.$currentUserUID');
  }

  static Future<List> fetchCollaboratorsUIDAndNumber({
    required SupabaseClient supabase,
    required String currentUserUID,
  }) async {
    final collabRes = await fetchCollaborationInfo(
        supabase: supabase, currentUserUID: currentUserUID);
    final collaboratorOne = collabRes[0]["collaborator_one"];
    final collaboratorTwo = collabRes[0]["collaborator_two"];
    return collaboratorOne == currentUserUID
        ? [collaboratorTwo, 2]
        : [collaboratorOne, 1];
  }

  static Future<List> createNewCollaboration({
    required SupabaseClient supabase,
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async {
    return await supabase.from('existing_collaborations').insert({
      'collaborator_one': collaboratorOneUID,
      'collaborator_two': collaboratorTwoUID,
      'who_gets_the_question': 1,
    }).select();
  }

  static Future<void> deleteExistingCollaboration({
    required SupabaseClient supabase,
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async {
    return await supabase
        .from('existing_collaborations')
        .delete()
        .eq('collaborator_one', collaboratorOneUID)
        .eq('collaborator_two', collaboratorTwoUID);
  }
}
