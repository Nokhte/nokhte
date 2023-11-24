import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsQueries extends CollaborativeQueries {
  static const tableName = "existing_collaborations";
  static const collaboratorOne = "collaborator_one";
  static const collaboratorTwo = "collaborator_two";
  static const isCurrentlyActive = 'is_currently_active';
  static const isConsecrated = "is_consecrated";
  static const whoIsTalking = "who_is_talking";
  ExistingCollaborationsQueries({required super.supabase});

  Future<List> createNewCollaboration({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async {
    return await supabase.from(tableName).insert({
      collaboratorOne: collaboratorOneUID,
      collaboratorTwo: collaboratorTwoUID,
      'who_gets_the_question': 2,
    }).select();
  }

  Future<List> consecrateTheCollaboration(
      {bool shouldConsecrate = true}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .update({isConsecrated: shouldConsecrate})
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        )
        .select();
  }

  Future<List> updateUserHasEnteredStatus(
      {required bool newEntryStatus}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_has_entered":
              newEntryStatus
        })
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        )
        .select();
  }

  Future<List> updateActivityStatus({
    required bool newActivityStatus,
  }) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .update({isCurrentlyActive: newActivityStatus})
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        )
        .eq(isCurrentlyActive, !newActivityStatus)
        .select();
  }

  Future<List> setUserAsTheCurrentTalker() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .update({
          whoIsTalking: collaboratorInfo.theUsersUID,
        })
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        )
        .select();
  }

  Future<void> clearTheCurrentTalker() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .update({
          whoIsTalking: null,
        })
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        );
  }

  Future<void> abortUnConsecratedTheCollaboration() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .delete()
        .eq(isCurrentlyActive, true)
        .eq(isConsecrated, false)
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        );
  }

  Future<void> deleteExistingCollaboration() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .delete()
        .eq(
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          collaboratorInfo.theUsersCollaboratorNumber,
          collaboratorInfo.theUsersUID,
        );
  }
}
