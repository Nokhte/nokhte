import 'package:nokhte_backend/tables/real_time_enabled/shared/shared.dart';

class FinishedCollaborativeP2PPurposeDocumentsQueries
    extends CollaborativeQueries {
  static const tableName = 'finished_collaborative_documents';
  FinishedCollaborativeP2PPurposeDocumentsQueries({required super.supabase});
  Future<List> fetchDocInfo({
    required String docType,
  }) async {
    //
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    // print(
    //     "${collaboratorInfo.theCollaboratorsNumber}_uid ${collaboratorInfo.theCollaboratorsUID}");
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
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
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
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
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
