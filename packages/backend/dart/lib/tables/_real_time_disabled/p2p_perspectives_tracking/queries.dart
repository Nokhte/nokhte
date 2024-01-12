import 'package:nokhte_backend/tables/_real_time_disabled/p2p_perspectives_tracking/types/types.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class P2PPerspectivesTrackingQueries extends CollaborativeQueries {
  static const tableName = "p2p_perspectives_tracking";
  static const currentPerspectives = "current_perspectives";
  static const pastPerspectives = "past_perspectives";
  static const currentCommittedAt = "current_committed_at";
  P2PPerspectivesTrackingQueries({required super.supabase});

  insertNewPerspectives({
    required List<String> newPerspectives,
  }) async {
    await ensureActiveCollaboratorInfo();

    final List checkRes = await selectPerspectivesRow();
    if (checkRes.isEmpty) {
      return await _insertIntoCurrentPerspectivesColumn(newPerspectives);
    } else {
      final thePastPerspectives = checkRes.first[pastPerspectives];
      final oldPerspectives = Perspectives(
        newPerspectives: checkRes.first[currentPerspectives],
        date: checkRes.first[currentCommittedAt],
      );

      if (thePastPerspectives.toString() == '{}') {
        return await _updatePastPerspectivesColumn(
            newPerspectives, oldPerspectives.toJson());
      } else {
        final List newPastCommitsList = thePastPerspectives["commits"];
        newPastCommitsList.add(oldPerspectives.toObject());
        final newObj = {"commits": newPastCommitsList};
        return await _updatePastPerspectivesColumn(newPerspectives, newObj);
      }
    }
  }

  deletePerspectivesRow() async {
    await ensureActiveCollaboratorInfo();
    await supabase.from(tableName).delete().eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  Future<List> selectPerspectivesRow() async {
    await ensureActiveCollaboratorInfo();
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

  _insertIntoCurrentPerspectivesColumn(List<String> newPerspectives) async =>
      await supabase.from(tableName).insert({
        "${collaboratorInfo.theCollaboratorsNumber}_uid":
            collaboratorInfo.theCollaboratorsUID,
        "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
            collaboratorInfo.theUsersUID,
        currentPerspectives: newPerspectives,
      }).select();

  _updatePastPerspectivesColumn(
      List<String> newPerspectives, Object pastPerspectives) async {
    return await supabase
        .from(tableName)
        .update({
          "current_committed_at": DateTime.now().toIso8601String(),
          "current_perspectives": newPerspectives,
          "past_perspectives": pastPerspectives,
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
