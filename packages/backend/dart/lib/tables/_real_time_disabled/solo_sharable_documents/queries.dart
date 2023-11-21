import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class SoloSharableDocumentQueries extends CollaborativeQueries {
  SoloSharableDocumentQueries({required super.supabase});

  static const table = "solo_sharable_documents";
  static const content = "content";
  static const isVisibleToCollaborator = "is_visible_to_collaborator";
  static const sessionIsCompleted = "session_is_completed";
  static const docType = "doc_type";
  static const ownerUID = "owner_uid";
  static const collaboratorUID = "collaborator_uid";
  static const createdAt = "created_at";

  Future<List> createSoloDoc({required String desiredDocType}) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase.from(table).insert({
      ownerUID: collaboratorInfo.theUsersUID,
      collaboratorUID: collaboratorInfo.theCollaboratorsUID,
      docType: desiredDocType,
    }).select();
  }

  Future<List> getDocInfo({required bool getCollaboratorsDoc}) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(table)
        .select()
        .eq(
          ownerUID,
          getCollaboratorsDoc
              ? collaboratorInfo.theCollaboratorsUID
              : collaboratorInfo.theUsersUID,
        )
        .eq(
          collaboratorUID,
          getCollaboratorsDoc
              ? collaboratorInfo.theUsersUID
              : collaboratorInfo.theCollaboratorsUID,
        )
        .order(createdAt, ascending: false)
        .limit(1);
  }

  Future<List> updateDocContent(String content) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(table)
        .update({
          content: content,
        })
        .eq(ownerUID, collaboratorInfo.theUsersUID)
        .order(
          createdAt,
          ascending: false,
        )
        .limit(1)
        .select();
  }

  Future<List> updateDocVisibility({
    required bool makeVisible,
  }) async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(table)
        .update({
          isVisibleToCollaborator: makeVisible,
        })
        .eq(ownerUID, collaboratorInfo.theUsersUID)
        .order(
          createdAt,
          ascending: false,
        )
        .limit(1)
        .select();
  }

  Future<List> sealDocument() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(table)
        .update({
          sessionIsCompleted: true,
        })
        .eq(ownerUID, collaboratorInfo.theUsersUID)
        .order(
          createdAt,
          ascending: false,
        )
        .limit(1)
        .select();
  }

  Future<void> deleteDocument() async {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    return await supabase
        .from(table)
        .delete()
        .eq(ownerUID, collaboratorInfo.theUsersUID)
        .order(
          createdAt,
          ascending: false,
        );
  }
}
