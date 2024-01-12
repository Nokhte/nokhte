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

  List<List<String>> isTheCurrentCollaborator() => [
        [
          collaboratorInfo.theCollaboratorsNumber,
          collaboratorInfo.theCollaboratorsUID,
        ]
      ];

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

  Future<List> _updateCollaboration(Map<String, dynamic> updates,
      List<List<String>> additionalConditions) async {
    await ensureActiveCollaboratorInfo();
    var query = supabase.from(tableName).update(updates);

    for (var condition in additionalConditions) {
      query = query.eq(condition[0], condition[1]);
    }

    return await query.select();
  }

  Future<List> consecrateTheCollaboration(
      {bool shouldConsecrate = true}) async {
    return await _updateCollaboration(
      {isConsecrated: shouldConsecrate},
      isTheCurrentCollaborator(),
    );
  }

  Future<List> setUserAsTheCurrentTalker() async {
    final currentQueue = await getWhoIsTalkingQueue();
    currentQueue.add(collaboratorInfo.theUsersUID);

    return await _updateCollaboration(
      {talkingQueue: currentQueue},
      isTheCurrentCollaborator(),
    );
  }

  Future<List> clearTheCurrentTalker() async {
    final List currentQueue = await getWhoIsTalkingQueue();
    currentQueue.removeAt(0);

    return await _updateCollaboration(
      {talkingQueue: currentQueue},
      isTheCurrentCollaborator(),
    );
  }

  // select queries
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

  Future<bool> checkIfUserHasTheQuestion() async {
    await ensureActiveCollaboratorInfo();
    final whoHasTheQuestionResponse =
        (await getCollaborations(filterForIsActive: true))
            .first[whoGetsTheQuestion];
    final int collaboratorNumber =
        collaboratorInfo.theUsersCollaboratorNumber == collaboratorOne ? 1 : 2;
    return collaboratorNumber == whoHasTheQuestionResponse;
  }

  Future<void> deleteExistingCollaboration(
      {bool filterForUnconsecrated = false}) async {
    await ensureActiveCollaboratorInfo();
    final baseQuery = await supabase
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
    if (filterForUnconsecrated) {
      return baseQuery.eq(isCurrentlyActive, true).eq(isConsecrated, false);
    } else {
      return baseQuery;
    }
  }
}
