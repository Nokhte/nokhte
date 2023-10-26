import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';

class WorkingCollaborativeDocumentsQueries extends CollaborativeQueries {
  static const tableName = 'working_collaborative_documents';
  WorkingCollaborativeDocumentsQueries({
    required super.supabase,
  });

  Future<void> updateExistingDocument({required String newContent}) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await supabase
        .from(tableName)
        .update({
          "content": newContent,
          "last_edited_by": currentUserUID,
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
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_is_active": isPresent,
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

  Future<void> updateDelta({required int delta}) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_delta": delta,
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

  Future<List> createCollaborativeDocument({
    required String docType,
  }) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
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
        "${collaboratorInfo.theCollaboratorsNumber}_uid":
            collaboratorInfo.theCollaboratorsUID,
        "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
            collaboratorInfo.theUsersUID,
        'doc_type': docType,
      }).select();
    } else {
      return [];
    }
  }

  Future<void> updateCommitDesireStatus({
    required bool wantsToCommit,
  }) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await supabase
        .from(tableName)
        .update({
          '${collaboratorInfo.theUsersCollaboratorNumber}_wants_to_commit':
              wantsToCommit,
        })
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
//
  }
}
