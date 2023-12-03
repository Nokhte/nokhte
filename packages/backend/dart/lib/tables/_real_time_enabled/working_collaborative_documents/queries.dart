import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class WorkingCollaborativeDocumentsQueries extends CollaborativeQueries {
  static const tableName = 'working_collaborative_documents';
  static const wantsToCommit = "wants_to_commit";
  static const delta = "delta";
  static const isActive = "is_active";
  static const content = "content";
  static const lastEditedBy = "last_edited_by";
  WorkingCollaborativeDocumentsQueries({
    required super.supabase,
  });

  // insert
  Future<List> createCollaborativeDocument({
    required String docType,
  }) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    final checkRes = await supabase
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

    if (checkRes.isEmpty) {
      return await supabase.from(tableName).insert({
        "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
            collaboratorInfo.theUsersUID,
        "${collaboratorInfo.theCollaboratorsNumber}_uid":
            collaboratorInfo.theCollaboratorsUID,
        'doc_type': docType,
      }).select();
    } else {
      return [];
    }
  }

  // select
  Future<List> getDocInfo() async {
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

  // delete
  Future<void> deleteThedoc() async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    await supabase
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

  // update
  Future<void> updateCommitDesireStatus({
    required bool wantsToCommitParam,
  }) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    await supabase
        .from(tableName)
        .update({
          '${collaboratorInfo.theUsersCollaboratorNumber}_$wantsToCommit':
              wantsToCommitParam,
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

  Future<void> updateDelta({required int deltaParam}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_$delta": deltaParam,
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

  Future<void> updatePresence({required bool isPresent}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_$isActive": isPresent,
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

  Future<void> updateUsersDocContent({required String newContent}) async {
    await figureOutActiveCollaboratorInfoIfNotDoneAlready();
    await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_$content": newContent,
          lastEditedBy: currentUserUID,
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
