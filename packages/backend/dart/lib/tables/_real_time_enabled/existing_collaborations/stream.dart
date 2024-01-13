import 'package:nokhte_backend/tables/_real_time_enabled/existing_collaborations/existing_collaborations.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsStream extends CollaborativeQueries {
  String userUID = '';
  ExistingCollaborationsStream({required super.supabase}) {
    userUID = supabase.auth.currentUser?.id ?? '';
  }

  bool collaboratorSearchListeningStatus = false;
  bool whoIsTalkingListeningStatus = false;
  bool sessionMetadataListeningStatus = false;

  bool isANewCollaboration(event) =>
      (event.first["collaborator_one"] == userUID ||
          event.first["collaborator_two"] == userUID) &&
      event.first["is_consecrated"] == false;

  Stream<bool> getCollaboratorSearchAndEntryStatus() async* {
    collaboratorSearchListeningStatus = true;
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id'])) {
      if (!collaboratorSearchListeningStatus) {
        break;
      }
      if (event.isNotEmpty) {
        if (isANewCollaboration(event)) {
          await ensureActiveCollaboratorInfo();
          yield true;
        } else {
          yield false;
        }
      } else {
        yield false;
      }
    }
  }

  cancelGetCollaboratorSearchStream() =>
      collaboratorSearchListeningStatus = false;

  cancelWhoIsTalkingtream() => whoIsTalkingListeningStatus = false;

  Stream<CollaborationSessionMetadata> getSessionMetadata() async* {
    await ensureActiveCollaboratorInfo();
    sessionMetadataListeningStatus = true;
    await for (var event in supabase
        .from('existing_collaborations')
        .stream(primaryKey: ['id']).eq(
      collaboratorInfo.theUsersCollaboratorNumber,
      collaboratorInfo.theUsersUID,
    )) {
      if (event.isEmpty) {
        yield CollaborationSessionMetadata.initial();
      } else {
        final userIndex = getIndexForCollaboratorNumber(
            collaboratorInfo.theUsersCollaboratorNumber);
        final collaboratorIndex = getIndexForCollaboratorNumber(
            collaboratorInfo.theCollaboratorsNumber);
        final onCallList = event.first[ExistingCollaborationsQueries.isOnCall];
        final isOnlineList =
            event.first[ExistingCollaborationsQueries.isOnline];
        final talkingQueue =
            event.first[ExistingCollaborationsQueries.talkingQueue];
        yield CollaborationSessionMetadata(
          userIsOnCall: onCallList[userIndex],
          collaboratorIsOnCall: onCallList[collaboratorIndex],
          userIsOnline: isOnlineList[userIndex],
          collaboratorIsOnline: isOnlineList[collaboratorIndex],
          timerShouldRun:
              event.first[ExistingCollaborationsQueries.timerShouldRun],
          collaboratorIsTalking:
              talkingQueue.isEmpty ? false : talkingQueue.first != userUID,
        );
      }
    }
  }
}
