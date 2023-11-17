// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';
import './types/types.dart';

class WorkingPerspectivesPositioningQueries extends CollaborativeQueries {
  WorkingPerspectivesPositioningQueries({
    required super.supabase,
  });

  Future<List> createPositioningSession() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    final List checkRes = await supabase
        .from(
          WorkingPerspectivesPositioningConstants.tableName,
        )
        .select()
        .eq("${collaboratorInfo.theCollaboratorsNumber}_uid",
            collaboratorInfo.theCollaboratorsUID)
        .eq("${collaboratorInfo.theUsersCollaboratorNumber}_uid",
            collaboratorInfo.theUsersUID);
    if (checkRes.isEmpty) {
      return await supabase
          .from(
        WorkingPerspectivesPositioningConstants.tableName,
      )
          .insert({
        "${collaboratorInfo.theCollaboratorsNumber}_uid":
            collaboratorInfo.theCollaboratorsUID,
        "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
            collaboratorInfo.theUsersUID,
        WorkingPerspectivesPositioningConstants.stagingArea: List.filled(5, ""),
      }).select();
    } else {
      return checkRes;
    }
  }

  Future<List> updateCurrentQuadrant({required int newQuadrant}) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    print("Is this thing running??? $newQuadrant");
    return await supabase
        .from(
          WorkingPerspectivesPositioningConstants.tableName,
        )
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_quadrant":
              newQuadrant,
        })
        .eq("${collaboratorInfo.theCollaboratorsNumber}_uid",
            collaboratorInfo.theCollaboratorsUID)
        .eq("${collaboratorInfo.theUsersCollaboratorNumber}_uid",
            collaboratorInfo.theUsersUID)
        .select();
  }

  Future<List> updateStagingAreaArr({required List<String> newArr}) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(
          WorkingPerspectivesPositioningConstants.tableName,
        )
        .update({
          WorkingPerspectivesPositioningConstants.stagingArea: newArr,
          WorkingPerspectivesPositioningConstants.lastEditedBy:
              collaboratorInfo.theUsersUID,
        })
        .eq("${collaboratorInfo.theCollaboratorsNumber}_uid",
            collaboratorInfo.theCollaboratorsUID)
        .eq("${collaboratorInfo.theUsersCollaboratorNumber}_uid",
            collaboratorInfo.theUsersUID)
        .select();
  }
}
