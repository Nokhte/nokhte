import 'package:nokhte_backend/tables/_real_time_enabled/existing_collaborations/existing_collaborations.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsStream extends CollaborativeQueries {
  String userUID = '';
  ExistingCollaborationsStream({required super.supabase}) {
    userUID = supabase.auth.currentUser?.id ?? '';
  }

  bool collaboratorSearchListeningStatus = false;
  bool whoIsTalkingListeningStatus = false;

  Stream<bool> getCollaboratorSearchStatus() async* {
    collaboratorSearchListeningStatus = true;
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id'])) {
      if (!collaboratorSearchListeningStatus) {
        break;
      }
      if (event.isNotEmpty) {
        if (event.first["collaborator_one"] == userUID ||
            event.first["collaborator_two"] == userUID) {
          yield true;
        } else {
          yield false;
        }
      }
    }
  }

  cancelGetCollaboratorSearchStream() =>
      collaboratorSearchListeningStatus = false;

  cancelWhoIsTalkingtream() => whoIsTalkingListeningStatus = false;

  Stream<bool> checkIfCollaboratorIsTalking() async* {
    if (collaboratorInfo.theCollaboratorsUID.isEmpty) {
      await figureOutActiveCollaboratorInfo();
    }
    whoIsTalkingListeningStatus = true;
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id']).eq(
      collaboratorInfo.theUsersCollaboratorNumber,
      collaboratorInfo.theUsersUID,
    )) {
      if (!whoIsTalkingListeningStatus) {
        break;
      }
      if (event.isEmpty) {
        yield false;
      } else if (event.first[ExistingCollaborationsQueries.whoIsTalking] ==
          null) {
        yield false;
      } else {
        yield event.first[ExistingCollaborationsQueries.whoIsTalking] ==
            collaboratorInfo.theCollaboratorsUID;
      }
    }
  }
}
