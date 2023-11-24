import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';
import 'package:intl/intl.dart';

class WorkingCollaborativeSchedulingQueries extends CollaborativeQueries {
  static const table = 'working_collaborative_scheduling';
  WorkingCollaborativeSchedulingQueries({required super.supabase});

  Future<List> createSchedulingSession({
    required String sessionTypeBeingPlanned,
  }) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    final checkRes = await supabase
        .from(table)
        .select()
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
    if (checkRes.isEmpty) {
      return await supabase.from(table).insert({
        '${collaboratorInfo.theCollaboratorsNumber}_uid':
            collaboratorInfo.theCollaboratorsUID,
        "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
            collaboratorInfo.theUsersUID,
        "session_being_scheduled": sessionTypeBeingPlanned,
      }).select();
    } else {
      return [];
    }
  }

  Future<void> deleteSchedulingSession() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    await supabase
        .from(table)
        .delete()
        .eq(
          '${collaboratorInfo.theCollaboratorsNumber}_uid',
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  updateTheDate(DateTime date) async {
    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    await supabase
        .from(table)
        .update({
          '${collaboratorInfo.theUsersCollaboratorNumber}_chosen_day':
              formattedDate,
        })
        .eq(
          '${collaboratorInfo.theCollaboratorsNumber}_uid',
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  updateTheTime(DateTime date) async {
    final formattedDate =
        DateTime(2003, 4, 9, date.hour, date.minute).toUtc().toIso8601String();
    await supabase
        .from(table)
        .update({
          '${collaboratorInfo.theUsersCollaboratorNumber}_chosen_time':
              formattedDate,
        })
        .eq(
          '${collaboratorInfo.theCollaboratorsNumber}_uid',
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  Future<void> updateTimeOrDate(DateTime date,
      {required bool updateDate}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    if (updateDate) {
      updateTheDate(date);
    } else {
      updateTheTime(date);
    }
  }
}
