import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';
import 'package:nokhte_backend/deprecated/_real_time_enabled/working_collaborative_documents/working_collaborative_documents.dart';

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
    await ensureActiveCollaboratorInfo();
    await for (var event in supabase
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
      "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
      collaboratorInfo.theUsersUID,
    )) {
      if (!docContentListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield DocInfoContent(
          content: "",
          lastEditor: LastEditedBy.initial,
          collaboratorsCommitDesireStatus: false,
          documentCommitStatus: false,
          userCommitDesireStatus: false,
        );
      } else {
        final collaboratorsNumber = collaboratorInfo.theCollaboratorsNumber;
        final usersUID = collaboratorInfo.theUsersUID;
        final usersCollaboratorNumber =
            collaboratorInfo.theUsersCollaboratorNumber;
        final row = event.first;
        final bothCollaboratorsAffirm =
            row["${collaboratorsNumber}_wants_to_commit"] &&
                row["${usersCollaboratorNumber}_wants_to_commit"];
        final String? lastEditedBy =
            row[WorkingCollaborativeDocumentsQueries.lastEditedBy];

        LastEditedBy lastEditor = LastEditedBy.initial;
        if (lastEditedBy == usersUID) {
          lastEditor = LastEditedBy.user;
        } else if (lastEditedBy == collaboratorInfo.theCollaboratorsUID) {
          lastEditor = LastEditedBy.collaborator;
        }
        yield DocInfoContent(
          content: row[WorkingCollaborativeDocumentsQueries.content],
          lastEditor: lastEditor,
          collaboratorsCommitDesireStatus:
              row["${collaboratorsNumber}_wants_to_commit"],
          documentCommitStatus: bothCollaboratorsAffirm,
          userCommitDesireStatus:
              row["${usersCollaboratorNumber}_wants_to_commit"],
        );
      }
    }
  }

  Stream<CollaboratorDocInfo> getCollaboratorDocumentInfo() async* {
    collaboratorPresenceListeningStatus = true;
    await ensureActiveCollaboratorInfo();
    await for (var event in supabase
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
            "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
            collaboratorInfo.theUsersUID)) {
      if (!collaboratorPresenceListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield CollaboratorDocInfo(isPresent: false, delta: -1);
      } else {
        yield CollaboratorDocInfo(
            isPresent: event
                .first["${collaboratorInfo.theCollaboratorsNumber}_is_active"],
            delta: event
                .first["${collaboratorInfo.theCollaboratorsNumber}_delta"]);
      }
    }
  }
}
