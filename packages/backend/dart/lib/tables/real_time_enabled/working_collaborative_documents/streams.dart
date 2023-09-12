import 'package:primala_backend/tables/real_time_enabled/existing_collaborations/types/types.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/existing_collaborations.dart';

class WorkingCollaborativeDocumentsStreams {
  bool docContentListeningStatus = false;
  bool collaboratorPresenceListeningStatus = false;
  bool collaboratorDeltaListeningStatus = false;
  String userUID = '';
  final SupabaseClient supabase;
  CollaboratorInfo collaboratorInfo = CollaboratorInfo(
    theCollaboratorsNumber: '',
    theCollaboratorsUID: '',
    theUsersCollaboratorNumber: '',
    theUsersUID: '',
  );
  WorkingCollaborativeDocumentsStreams({required this.supabase}) {
    userUID = supabase.auth.currentUser?.id ?? '';
  }

  Future<void> figureOutCollaboratorInfo() async {
    collaboratorInfo =
        await ExistingCollaborationsQueries.computeCollaboratorInfo(
      currentUserUID: userUID,
      supabase: supabase,
    );
  }

  Stream<DocInfoContent> docContentStream({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    docContentListeningStatus = true;
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutCollaboratorInfo();
    }
    await for (var event in supabase
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
            "${collaboratorInfo.theUsersCollaboratorNumber}_uid",
            collaboratorInfo.theUsersUID)) {
      // .eq("${collaboratorInfo.theCollaboratorsNumber}_uid", userUID)) {
      if (!docContentListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield DocInfoContent(
          content: "",
          lastEditedBy: "",
          currentUserUID: "",
        );
      } else {
        yield DocInfoContent(
          content: event[0]["content"],
          lastEditedBy: event[0]["last_edited_by"] ?? '',
          currentUserUID: userUID,
        );
      }
    }
  }

  Stream<bool> isCollaboratorOnDocument({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    collaboratorPresenceListeningStatus = true;
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutCollaboratorInfo();
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
        yield false;
      } else {
        yield event[0]["${collaboratorInfo.theCollaboratorsNumber}_is_active"]
            as bool;
      }
    }
  }

  Stream<int> getCollaboratorDelta({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutCollaboratorInfo();
    }
    collaboratorDeltaListeningStatus = true;
    await for (var event in supabase
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
            "${collaboratorInfo.theUsersCollaboratorNumber}_uid", userUID)) {
      if (!collaboratorDeltaListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield -1;
      } else {
        yield event[0]["${collaboratorInfo.theCollaboratorsNumber}_delta"]
            as int;
      }
    }
  }
}
