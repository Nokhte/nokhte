import 'package:primala_backend/tables/real_time_enabled/shared/shared.dart';

class ExistingCollaborationsQueries extends CollaborativeQueries {
  static const tableName = "existing_collaborations";
  static const collaboratorOne = "collaborator_one";
  static const collaboratorTwo = "collaborator_two";
  static const isCurrentlyActive = 'is_currently_active';
  ExistingCollaborationsQueries({required super.supabase});

  Future<List> createNewCollaboration({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async {
    return await supabase.from(tableName).insert({
      collaboratorOne: collaboratorOneUID,
      collaboratorTwo: collaboratorTwoUID,
      'who_gets_the_question': 1,
    }).select();
  }

  Future<void> updateActivityStatus({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
    required bool newActivityStatus,
  }) async {
    final something = await supabase
        .from(tableName)
        .update({isCurrentlyActive: newActivityStatus})
        .eq(collaboratorOne, collaboratorOneUID)
        .eq(collaboratorTwo, collaboratorTwoUID)
        .eq(isCurrentlyActive, !newActivityStatus)
        .select();
    print("did it happen??? $something");
    // so test this method, make sure it works, then all you need to do is flip
    // the switch at the end of the session and if you want to cover your ass
    // down the line, you can create a method that recursively changes all a persons
    // collaborations to false thats activated on the home page
  }

  Future<void> deleteExistingCollaboration({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async {
    return await supabase
        .from(tableName)
        .delete()
        .eq(collaboratorOne, collaboratorOneUID)
        .eq(collaboratorTwo, collaboratorTwoUID);
  }
}
