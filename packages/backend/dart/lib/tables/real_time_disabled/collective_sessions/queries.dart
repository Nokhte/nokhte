import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';

class CollectiveSessionQueries extends CollaborativeQueries {
  static const tableName = 'collective_sessions';
  static const commitMessage = 'commit_message';
  static const individualSessionTimestamp = "individual_session_timestamp";
  static const individualSessionMetadata = "individual_session_metadata";
  CollectiveSessionQueries({required super.supabase});

  Future<List> createNewSession() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase.from(tableName).insert({
      "${collaboratorInfo.theCollaboratorsNumber}_uid":
          collaboratorInfo.theCollaboratorsUID,
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
          collaboratorInfo.theUsersUID,
    });
  }

  Future<List> submitCommitMessage(String commitMsg) async =>
      await supabase.from(tableName).update({
        commitMessage: commitMsg,
      });

  Future updateTheirIndividualSessionFields({
    required DateTime individualSessionTimestamp,
    required Map sessionMetadata,
  }) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(tableName)
        .update({
          "${collaboratorInfo.theUsersCollaboratorNumber}_$individualSessionTimestamp":
              individualSessionTimestamp.toIso8601String(),
          "${collaboratorInfo.theUsersCollaboratorNumber}_$individualSessionMetadata":
              sessionMetadata,
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

  Future<List> getCollaboratorsSessionMetadata() async {
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
