import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:primala_backend/existing_collaborations.dart';

class WorkingCollaborativeDocumentsStreams {
  bool docContentListeningStatus = false;
  bool collaboratorPresenceListeningStatus = false;
  bool collaboratorDeltaListeningStatus = false;
  int theUsersCollaboratorNumber = -1;
  final SupabaseClient supabase;
  String userUID = '';
  String theCollaboratorToListenFor = '';

  WorkingCollaborativeDocumentsStreams({required this.supabase}) {
    userUID = supabase.auth.currentUser?.id ?? '';
    figureOutCollaboratorInfo();
  }

  Future<void> figureOutCollaboratorInfo() async {
    final List collaboratorsUIDRes =
        await ExistingCollaborationsQueries.fetchCollaboratorsUIDAndNumber(
      supabase: supabase,
      currentUserUID: userUID,
    );

    /// @ dev return Data Structue is ["someUID", `1` or `2`]
    /// @ 1 indicates collaborator_one and 2 collaborator_two
    theCollaboratorToListenFor =
        collaboratorsUIDRes[1] == 1 ? "collaborator_one" : "collaborator_two";
    theUsersCollaboratorNumber = collaboratorsUIDRes[0] == 1 ? 2 : 1;
  }

  Stream<String> docContentStream({
    required SupabaseClient supabase,
    required String userUID,
  }) async* {
    supabase.channel('public:working_collaborative_documents').on(
      RealtimeListenTypes.postgresChanges,
      ChannelFilter(
          event: '*',
          schema: 'public',
          table: 'working_collaborative_documents'),
      (payload, [ref]) {
        print('Change received: ${payload.toString()}');
      },
    ).subscribe();
    if (theCollaboratorToListenFor.isEmpty) {
      await figureOutCollaboratorInfo();
    }

    docContentListeningStatus = true;
    await for (var event in supabase
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
      theUsersCollaboratorNumber == 1
          ? 'collaborator_two_uid'
          : 'collaborator_one_uid',
      userUID,
    )) {
      // if (!docContentListeningStatus) {
      //   break;
      // }
      if (event.isEmpty) {
        yield "";
      } else {
        print(event[0]["content"]);
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
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
      theUsersCollaboratorNumber == 1
          ? 'collaborator_one_uid'
          : 'collaborator_two_uid',
      userUID,
    )) {
      if (!collaboratorPresenceListeningStatus) {
        break;
      }
      if (theCollaboratorToListenFor.isEmpty) {
        await figureOutCollaboratorInfo();
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
        .from('working_collaborative_documents')
        .stream(primaryKey: ['id']).eq(
      theUsersCollaboratorNumber == 1
          ? 'collaborator_one_uid'
          : 'collaborator_two_uid',
      userUID,
    )) {
      if (!collaboratorDeltaListeningStatus) {
        break;
      }
      if (theCollaboratorToListenFor.isEmpty) {
        await figureOutCollaboratorInfo();
      }
      if (event.isEmpty) {
        yield -1;
      } else {
        yield event[0]["${theCollaboratorToListenFor}_delta"] as int;
      }
    }
  }
}
