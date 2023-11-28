import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class TimerInformationQueries extends CollaborativeQueries {
  static const tableName = "timer_information";
  static const isOnline = "is_online";
  static const timerIsRunning = "timer_is_running";
  static const hasCompletedTimer = "has_completed_timer";
  // static const timeRemainingInMilliseconds = "time_remaining_in_milliseconds";
  static const createdAt = "created_at";

  TimerInformationQueries({required super.supabase});

  Future<List> createNewTimer({
    required double timerLengthInMilliseconds,
  }) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    final checkRes = await selectMostRecentTimer();
    print(checkRes);
    if (checkRes.isEmpty) {
      return await supabase.from(tableName).insert({
        "${collaboratorInfo.theCollaboratorsNumber}_uid":
            collaboratorInfo.theCollaboratorsUID,
        "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
            collaboratorInfo.theUsersUID,
        // timeRemainingInMilliseconds: timerLengthInMilliseconds,
      }).select();
    } else {
      return checkRes;
    }
  }

  Future<void> markTimerAsComplete() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_$hasCompletedTimer":
              true,
        })
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  Future<void> deleteTheTimer() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .delete()
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  Future<List> selectMostRecentTimer() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .select()
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  Future<List> updateTimerRunningStatus({required bool newTimerStatus}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .update({
          timerIsRunning: newTimerStatus,
        })
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        )
        .select();
  }

  Future<List> updatePresence({required bool isOnlineParam}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    return await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_$isOnline":
              isOnlineParam,
        })
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        )
        .select();
  }
}
