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

  Future<List> createSoloDoc(String desiredDocType) async {
    await ensureActiveCollaboratorInfo();
    return await supabase.from(table).insert({
      ownerUID: collaboratorInfo.theUsersUID,
      collaboratorUID: collaboratorInfo.theCollaboratorsUID,
      docType: desiredDocType,
    }).select();
  }

  Future<List> getDocInfo({required bool getCollaboratorsDoc}) async {
    await ensureActiveCollaboratorInfo();
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

  Future<List> updateDocContent(String contentParam) async {
    await ensureActiveCollaboratorInfo();
    return await supabase
        .from(table)
        .update({
          content: contentParam,
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
    await ensureActiveCollaboratorInfo();
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
    await ensureActiveCollaboratorInfo();
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

  Future<List> deleteAllAssociatedWith(
      String ownerUIDParam, String collaboratorUIDParam) async {
    print("UID $ownerUIDParam collab $collaboratorUIDParam");
    return await supabase
        .from(table)
        .delete()
        .eq(ownerUID, ownerUIDParam)
        .eq(collaboratorUID, collaboratorUIDParam)
        .select();
  }

  Future<List> deleteDocument() async {
    await ensureActiveCollaboratorInfo();
    return await supabase
        .from(table)
        .delete()
        .eq(ownerUID, collaboratorInfo.theUsersUID)
        .eq(collaboratorUID, collaboratorInfo.theCollaboratorsUID)
        .order(
          createdAt,
          ascending: false,
        )
        .limit(1)
        .select();
  }
}
