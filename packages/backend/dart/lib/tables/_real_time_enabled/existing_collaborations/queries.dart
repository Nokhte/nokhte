import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsQueries extends CollaborativeQueries {
  static const tableName = "existing_collaborations";
  static const collaboratorOne = "collaborator_one";
  static const collaboratorTwo = "collaborator_two";
  static const isCurrentlyActive = 'is_currently_active';
  static const isOnCall = "is_on_call";
  static const isOnline = "is_online";
  static const timerShouldRun = "timer_should_run";
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

  Future<List> setOnlineStatus(bool isOnlineParam) async {
    final currentOnlineStatus = await getWhoIsOnline();
    final indexToEdit = getIndexForCollaboratorNumber(
        collaboratorInfo.theUsersCollaboratorNumber);
    currentOnlineStatus[indexToEdit] = isOnlineParam;
    return await onCurrentActiveCollaboration(supabase.from(tableName).update({
      isOnline: currentOnlineStatus,
    }));
  }

  Future<List> setOnCallStatus(bool isOnCallParam) async {
    final currentOnCallStatus = await getWhoIsOnTheCall();
    final indexToEdit = getIndexForCollaboratorNumber(
        collaboratorInfo.theUsersCollaboratorNumber);
    currentOnCallStatus[indexToEdit] = isOnCallParam;
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({
        isOnCall: currentOnCallStatus,
      }),
    );
  }

  Future<List> setTimerRunningStatus(bool shouldRun) async {
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({
        timerShouldRun: shouldRun,
      }),
    );
  }

  Future<List> setUserAsTheCurrentTalker() async {
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
    final List currentQueue = await getWhoIsTalkingQueue();
    currentQueue.removeAt(0);
    await ensureActiveCollaboratorInfo();
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).update({
        talkingQueue: currentQueue,
      }),
    );
  }

  Future<void> abortUnConsecratedTheCollaboration() async {
    await ensureActiveCollaboratorInfo();
    return await onCurrentActiveCollaboration(
      supabase.from(tableName).delete().eq(
            isConsecrated,
            false,
          ),
    );
  }

  Future<void> deleteExistingCollaboration() async {
    await ensureActiveCollaboratorInfo();
    return await onCurrentActiveCollaboration(
        supabase.from(tableName).delete());
  }
}
