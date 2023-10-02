import 'package:primala_backend/tables/real_time_enabled/shared/shared.dart';

class ExistingCollaborationsQueries extends CollaborativeQueries {
  ExistingCollaborationsQueries({required super.supabase});

  Future<List> createNewCollaboration({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async {
    return await supabase.from('existing_collaborations').insert({
      'collaborator_one': collaboratorOneUID,
      'collaborator_two': collaboratorTwoUID,
      'who_gets_the_question': 1,
    }).select();
  }

  Future<void> deleteExistingCollaboration({
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
