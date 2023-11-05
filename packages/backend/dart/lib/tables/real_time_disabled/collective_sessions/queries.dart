import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';

class CollectiveSessionQueries extends CollaborativeQueries {
  static const tableName = 'collective_sessions';
  static const commitMessage = 'commit_message';
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
}
