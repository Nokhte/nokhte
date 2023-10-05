import 'package:primala_backend/tables/real_time_enabled/shared/shared.dart';
import 'types/types.dart';

class WorkingCollaborativeDocumentsStreams extends CollaborativeQueries {
  bool docContentListeningStatus = false;
  bool collaboratorPresenceListeningStatus = false;
  bool collaboratorDeltaListeningStatus = false;

  String userUID = '';
  WorkingCollaborativeDocumentsStreams({
    required super.supabase,
  }) {
    userUID = supabase.auth.currentUser?.id ?? '';
  }

  docContentDispose() {
    docContentListeningStatus = false;
  }

  collaboratorPresenceDispose() {
    collaboratorPresenceListeningStatus = false;
  }

  collaboratorDeltaDispose() {
    collaboratorDeltaListeningStatus = false;
  }

  Stream<DocInfoContent> docContentStream() async* {
    docContentListeningStatus = true;
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await for (var event in supabase
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
      collaboratorInfo.theUsersUID,
    )) {
      // .eq("${collaboratorInfo.theCollaboratorsNumber}_uid", userUID)) {
      if (!docContentListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield DocInfoContent(
          content: "",
          lastEditedBy: "",
          currentUserUID: "",
          collaboratorsCommitDesireStatus: false,
          documentCommitStatus: false,
        );
      } else {
        yield DocInfoContent(
          content: event[0]["content"],
          lastEditedBy: event[0]["last_edited_by"] ?? '',
          currentUserUID: userUID,
          collaboratorsCommitDesireStatus: event[0]
              ["${collaboratorInfo.theCollaboratorsNumber}_wants_to_commit"],
          documentCommitStatus: event[0]["is_committed"],
        );
      }
    }
  }

  Stream<CollaboratorDocInfo> getCollaboratorDocumentInfo() async* {
    collaboratorPresenceListeningStatus = true;
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    await for (var event in supabase
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
            "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
            collaboratorInfo.theUsersUID)) {
      // .eq("${collaboratorInfo.theCollaboratorsNumber}_uid", userUID)) {
      if (!collaboratorPresenceListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield CollaboratorDocInfo(isPresent: false, delta: -1);
      } else {
        yield CollaboratorDocInfo(
            isPresent: event[0]
                ["${collaboratorInfo.theCollaboratorsNumber}_is_active"],
            delta: event[0]
                ["${collaboratorInfo.theCollaboratorsNumber}_delta"]);
      }
    }
  }
}
