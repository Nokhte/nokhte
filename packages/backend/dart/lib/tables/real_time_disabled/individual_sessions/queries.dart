// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';

class IndividualSessionsQueries extends CollaborativeQueries {
  static const TABLE_NAME = "individual_sessions";
  static const OWNER_UID = "owner_uid";
  static const SESSION_METADATA = "session_metadata";

  IndividualSessionsQueries({required super.supabase});

  Future<List> createNewSession() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase.from(TABLE_NAME).insert({
      OWNER_UID: collaboratorInfo.theUsersUID,
      "${collaboratorInfo.theCollaboratorsNumber}_uid":
          collaboratorInfo.theCollaboratorsUID,
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
          collaboratorInfo.theUsersUID,
      SESSION_METADATA: {},
    }).select();
  }

  Future<List> updateSessionMetadata({required Object newMetadata}) async {
    return await supabase
        .from(TABLE_NAME)
        .update({
          SESSION_METADATA: newMetadata,
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
