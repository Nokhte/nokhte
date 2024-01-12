import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class FinishedCollaborativeDocumentsQueries extends CollaborativeQueries {
  static const tableName = 'finished_collaborative_documents';
  FinishedCollaborativeDocumentsQueries({required super.supabase});
  Future<List> getDocInfo({
    required String docType,
  }) async {
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
        )
        .eq('doc_type', docType)
        .order(
          'created_at',
          ascending: false,
        )
        .limit(1);
  }

  Future<List> insertDoc({
    required String docType,
    required String content,
  }) async {
    await ensureActiveCollaboratorInfo();
    return await supabase.from(tableName).insert({
      "${collaboratorInfo.theCollaboratorsNumber}_uid":
          collaboratorInfo.theCollaboratorsUID,
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid":
          collaboratorInfo.theUsersUID,
      'doc_type': docType,
      'content': content,
    }).select();
  }

  Future<void> deleteADoc() async {
    await ensureActiveCollaboratorInfo();
    return await supabase
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
}
