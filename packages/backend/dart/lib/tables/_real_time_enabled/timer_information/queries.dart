import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class TimerInformationQueries extends CollaborativeQueries {
  static const tableName = "timer_information";
  static const isOnline = "is_online";
  static const timerIsRunning = "timer_is_running";
  static const timeRemainingInMilliseconds = "time_remaining_in_milliseconds";

  TimerInformationQueries({required super.supabase});

  Future<List> createNewTimer({
    required double timerLengthInMilliseconds,
  }) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase.from(tableName).insert({
      "${collaboratorInfo.theCollaboratorsNumber}_uid":
          collaboratorInfo.theCollaboratorsUID,
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
          collaboratorInfo.theUsersUID,
      timeRemainingInMilliseconds: timerLengthInMilliseconds,
    }).select();
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
}
