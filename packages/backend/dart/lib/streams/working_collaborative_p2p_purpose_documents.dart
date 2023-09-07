import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/existing_collaborations.dart';

class WorkingCollaborativeP2PPurposeDocumentsStream {
  bool docContentListeningStatus = false;
  bool collaboratorPresenceListeningStatus = false;
  bool collaboratorDeltaListeningStatus = false;
  final SupabaseClient supabase;
  String userUID = '';
  String theCollaboratorToListenFor = '';

  WorkingCollaborativeP2PPurposeDocumentsStream({required this.supabase}) {
    userUID = supabase.auth.currentUser?.id ?? '';
    figureOutTheCollaboratorToListenFor();
  }

  Future<void> figureOutTheCollaboratorToListenFor() async {
    final res = await ExistingCollaborationsQueries.fetchCollaborationInfo(
      supabase: supabase,
      currentUserUID: userUID,
    );
    final collaboratorOne = res[0]["collaborator_one"];

    theCollaboratorToListenFor =
        collaboratorOne == userUID ? "collaborator_two" : collaboratorOne;
  }

  Stream<String> docContentStream({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    docContentListeningStatus = true;
    await for (var event in supabase
        .from('working_collaborative_p2p_purpose_documents')
        .stream(primaryKey: ['id'])) {
      if (!docContentListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield "";
      } else {
        yield event[0]["content"] as String;
      }
    }
  }

  Stream<bool> isCollaboratorOnDocument({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    collaboratorPresenceListeningStatus = true;
    await for (var event in supabase
        .from('working_collaborative_p2p_purpose_documents')
        .stream(primaryKey: ['id'])) {
      if (!collaboratorPresenceListeningStatus) {
        break;
      }
      if (theCollaboratorToListenFor.isEmpty) {
        await figureOutTheCollaboratorToListenFor();
      }
      if (event.isEmpty) {
        yield false;
      } else {
        yield event[0]["${theCollaboratorToListenFor}_is_active"] as bool;
      }
    }
  }

  Stream<int> getCollaboratorDelta({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    collaboratorDeltaListeningStatus = true;
    await for (var event in supabase
        .from('working_collaborative_p2p_purpose_documents')
        .stream(primaryKey: ['id'])) {
      if (!collaboratorDeltaListeningStatus) {
        break;
      }
      if (theCollaboratorToListenFor.isEmpty) {
        await figureOutTheCollaboratorToListenFor();
      }
      if (event.isEmpty) {
        yield -1;
      } else {
        yield event[0]["${theCollaboratorToListenFor}_delta"] as int;
      }
    }
  }
}
