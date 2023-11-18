import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';
import 'package:nokhte_core/custom_control_structures.dart';

class TimerInformationQueries extends CollaborativeQueries {
  static const tableName = "timer_information";
  static const isOnline = "is_online";
  static const timerIsRunning = "timer_is_running";
  static const timeRemainingInMilliseconds = "time_remaining_in_milliseconds";
  static const createdAt = "created_at";

  TimerInformationQueries({required super.supabase});

  Future<List> createNewTimer({
    required double timerLengthInMilliseconds,
  }) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final checkRes = await selectMostRecentTimer();
    if (checkRes.isEmpty) {
      final isMoreThanAnHour = DurationUtils.isMoreThanAnHour(
          startTime: DateTime.parse(checkRes.first[createdAt]),
          endTime: DateTime.now());
      if (isMoreThanAnHour) {
        return await supabase.from(tableName).insert({
          "${collaboratorInfo.theCollaboratorsNumber}_uid":
              collaboratorInfo.theCollaboratorsUID,
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
              collaboratorInfo.theUsersUID,
          timeRemainingInMilliseconds: timerLengthInMilliseconds,
        }).select();
      } else {
        return checkRes;
      }
    } else {
      return checkRes;
    }
  }

  Future<void> deleteTheTimer() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
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
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
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
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
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
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
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

  Future<void> markDownTheTimer() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final double pastClockVal = (await selectMostRecentTimer())
        .first[timeRemainingInMilliseconds]
        .toDouble();

    final double newClockVal = pastClockVal - 1;
    await supabase
        .from(tableName)
        .update({
          timeRemainingInMilliseconds: newClockVal,
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
}
