// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/real_time_disabled/p2p_perspectives_tracking/types/types.dart';
import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';
//todo break this up into smaller functions

class P2PPerspectivesTracking extends CollaborativeQueries {
  static const TABLE_NAME = "p2p_perspectives_tracking";
  static const CURRENT_PERSPECTIVES = "current_perspectives";
  static const PAST_PERSPECTIVES = "past_perspectives";
  static const CURRENT_COMMITTED_AT = "current_committed_at";
  P2PPerspectivesTracking({required super.supabase});

  insertNewPerspectives({
    required List<String> newPerspectives,
  }) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final List checkRes = await supabase
        .from(TABLE_NAME)
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
      return await supabase.from(TABLE_NAME).insert({
        "${collaboratorInfo.theCollaboratorsNumber}_uid":
            collaboratorInfo.theCollaboratorsUID,
        "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
            collaboratorInfo.theUsersUID,
        CURRENT_PERSPECTIVES: newPerspectives,
      }).select();
    } else {
      final pastPerspectives = checkRes[0][PAST_PERSPECTIVES];
      final oldPerspectives = Perspectives(
        newPerspectives: checkRes[0][CURRENT_PERSPECTIVES],
        date: checkRes[0][CURRENT_COMMITTED_AT],
      );

      if (pastPerspectives.toString() == '{}') {
        // print("is this running??");
        return await supabase
            .from(TABLE_NAME)
            .update({
              "current_committed_at": DateTime.now().toIso8601String(),
              "current_perspectives": newPerspectives,
              "past_perspectives": oldPerspectives.toJson(),
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
      } else {
        final List newPastCommitsList = pastPerspectives["commits"];
        newPastCommitsList.add(oldPerspectives.toObject());
        final newObj = {"commits": newPastCommitsList};

        return await supabase
            .from(TABLE_NAME)
            .update({
              "current_committed_at": DateTime.now().toIso8601String(),
              "current_perspectives": newPerspectives,
              "past_perspectives": newObj,
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
  }

  deletePerspectivesRow() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await supabase.from(TABLE_NAME).delete().eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }
}
