import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsQueries extends CollaborativeQueries {
  static const tableName = "existing_collaborations";
  static const collaboratorOne = "collaborator_one";
  static const collaboratorTwo = "collaborator_two";
  static const isCurrentlyActive = 'is_currently_active';
  static const isConsecrated = "is_consecrated";
  static const whoGetsTheQuestion = "who_gets_the_question";
  static const collaborationID = "collaboration_id";
  static const talkingQueue = "talking_queue";
  ExistingCollaborationsQueries({required super.supabase});

  Future<List> createNewCollaboration({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async {
    return await supabase.from(tableName).insert({
      collaboratorOne: collaboratorOneUID,
      collaboratorTwo: collaboratorTwoUID,
      collaborationID: "${collaboratorOneUID}_$collaboratorTwoUID",
      'who_gets_the_question': 2,
    }).select();
  }

  Future<List> consecrateTheCollaboration(
      {bool shouldConsecrate = true}) async {
    await ensureActiveCollaboratorInfo();
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
    await ensureActiveCollaboratorInfo();
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
    await ensureActiveCollaboratorInfo();
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

  Future<List> getWhoIsTalkingQueue() async {
    await ensureActiveCollaboratorInfo();
    return (await supabase
            .from(tableName)
            .select()
            .eq(
              collaboratorInfo.theCollaboratorsNumber,
              collaboratorInfo.theCollaboratorsUID,
            )
            .eq(
              collaboratorInfo.theUsersCollaboratorNumber,
              collaboratorInfo.theUsersUID,
            ))
        .first[talkingQueue];
  }

  Future<List> setUserAsTheCurrentTalker() async {
    final currentQueue = await getWhoIsTalkingQueue();
    currentQueue.add(collaboratorInfo.theUsersUID);
    return await supabase
        .from(tableName)
        .update({
          talkingQueue: currentQueue,
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

  Future<bool> checkIfUserHasTheQuestion() async {
    await ensureActiveCollaboratorInfo();
    final whoHasTheQuestionResponse =
        (await getCollaborations(filterForIsActive: true))
            .first[whoGetsTheQuestion];
    final int collaboratorNumber =
        collaboratorInfo.theUsersCollaboratorNumber == collaboratorOne ? 1 : 2;
    return collaboratorNumber == whoHasTheQuestionResponse;
  }

  Future<void> clearTheCurrentTalker() async {
    final List currentQueue = await getWhoIsTalkingQueue();
    currentQueue.removeAt(0);
    await ensureActiveCollaboratorInfo();
    return await supabase
        .from(tableName)
        .update({
          talkingQueue: currentQueue,
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
    await ensureActiveCollaboratorInfo();
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
    await ensureActiveCollaboratorInfo();
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
