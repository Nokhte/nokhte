import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsQueries extends CollaborativeQueries {
  static const collaborationID = "collaboration_id";
  static const collaboratorOne = "collaborator_one";
  static const collaboratorTwo = "collaborator_two";
  static const currentPhases = "current_phases";
  static const isConsecrated = "is_consecrated";
  static const isCurrentlyActive = "is_currently_active";
  static const isOnCall = "is_on_call";
  static const isOnline = "is_online";
  static const tableName = "existing_collaborations";
  static const talkingQueue = "talking_queue";
  static const timerShouldRun = "timer_should_run";
  static const whoGetsTheQuestion = "who_gets_the_question";
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
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update(
        {isConsecrated: shouldConsecrate},
      ),
    );
  }

  Future<List> updateActivityStatus({
    required bool newActivityStatus,
  }) async {
    await ensureActiveCollaboratorInfo();
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update(
        {isCurrentlyActive: newActivityStatus},
      ),
    );
  }

  Future _getCollaborationProperty(String property) async {
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
        .first[property];
  }

  Future<List> getWhoIsTalkingQueue() async =>
      await _getCollaborationProperty(talkingQueue);

  Future<List> getWhoIsOnline() async =>
      await _getCollaborationProperty(isOnline);

  Future<List> getWhoIsOnTheCall() async =>
      await _getCollaborationProperty(isOnCall);

  Future<List> getCurrentPhases() async =>
      await _getCollaborationProperty(currentPhases);

  Future<List> updateOnlineStatus(
    bool isOnlineParam, {
    bool shouldEditCollaboratorsInfo = false,
  }) async {
    final currentOnlineStatus = await getWhoIsOnline();
    final indexToEdit = getIndexForCollaboratorNumber(
        shouldEditCollaboratorsInfo
            ? collaboratorInfo.theCollaboratorsNumber
            : collaboratorInfo.theUsersCollaboratorNumber);
    currentOnlineStatus[indexToEdit] = isOnlineParam;
    return await onCurrentActiveCollaboration(supabase.from(tableName).update({
      isOnline: currentOnlineStatus,
    }));
  }

  Future<List> updateOnCallStatus(
    bool isOnCallParam, {
    bool shouldEditCollaboratorsInfo = false,
  }) async {
    await ensureActiveCollaboratorInfo();
    final currentOnCallStatus = await getWhoIsOnTheCall();
    final indexToEdit = getIndexForCollaboratorNumber(
        shouldEditCollaboratorsInfo
            ? collaboratorInfo.theCollaboratorsNumber
            : collaboratorInfo.theUsersCollaboratorNumber);
    currentOnCallStatus[indexToEdit] = isOnCallParam;
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({
        isOnCall: currentOnCallStatus,
      }),
    );
  }

  Future<List> updateCurrentPhases(
    double newPhase, {
    bool shouldEditCollaboratorsInfo = false,
  }) async {
    await ensureActiveCollaboratorInfo();
    final List currentPhasesRes = await getCurrentPhases();
    final indexToEdit = getIndexForCollaboratorNumber(
        shouldEditCollaboratorsInfo
            ? collaboratorInfo.theCollaboratorsNumber
            : collaboratorInfo.theUsersCollaboratorNumber);
    currentPhasesRes[indexToEdit] = newPhase;
    print(currentPhases);
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({
        currentPhases: currentPhasesRes,
      }),
    );
  }

  Future<List> updateTimerRunningStatus(bool shouldRun) async {
    await ensureActiveCollaboratorInfo();
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({
        timerShouldRun: shouldRun,
      }),
    );
  }

  Future<List> setUserAsTheCurrentTalker() async {
    await ensureActiveCollaboratorInfo();
    final currentQueue = await getWhoIsTalkingQueue();
    currentQueue.add(collaboratorInfo.theUsersUID);
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({talkingQueue: currentQueue}),
    );
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
    await ensureActiveCollaboratorInfo();
    final List currentQueue = await getWhoIsTalkingQueue();
    currentQueue.removeAt(0);
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({
        talkingQueue: currentQueue,
      }),
    );
  }

  Future<List> deleteUnConsecratedTheCollaboration() async {
    await ensureActiveCollaboratorInfo();
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).delete().eq(
            isConsecrated,
            false,
          ),
    );
  }

  Future<List> deleteExistingCollaboration() async {
    await ensureActiveCollaboratorInfo();
    return await onCurrentActiveCollaboration(
        supabase.from(tableName).delete());
  }
}
