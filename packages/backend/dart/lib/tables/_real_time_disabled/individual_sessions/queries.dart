import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class IndividualSessionsQueries extends CollaborativeQueries {
  static const tableName = "individual_sessions";
  static const ownerUID = "owner_uid";
  static const sessionMetadata = "session_metadata";
  static const sessionHeldAt = 'session_held_at';

  IndividualSessionsQueries({required super.supabase});

  Future<List> createNewSession() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase.from(tableName).insert({
      ownerUID: collaboratorInfo.theUsersUID,
      "${collaboratorInfo.theCollaboratorsNumber}_uid":
          collaboratorInfo.theCollaboratorsUID,
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
          collaboratorInfo.theUsersUID,
      sessionMetadata: {},
    }).select();
  }

  Future<List> getLatestSessionInfo() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(tableName)
        .select()
        .eq(ownerUID, collaboratorInfo.theUsersUID)
        .eq(
          "${collaboratorInfo.theCollaboratorsNumber}_uid",
          collaboratorInfo.theCollaboratorsUID,
        )
        .eq(
          "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
          collaboratorInfo.theUsersUID,
        );
  }

  Future<List> updateSessionMetadata({required Map newMetadata}) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(tableName)
        .update({
          sessionMetadata: newMetadata,
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

  Future<void> deleteTheRow() async =>
      await supabase.from(tableName).delete().eq(ownerUID, currentUserUID);
}
