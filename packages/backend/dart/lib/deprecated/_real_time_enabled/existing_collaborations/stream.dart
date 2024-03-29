import 'package:nokhte_backend/deprecated/_real_time_enabled/existing_collaborations/existing_collaborations.dart';
import 'package:nokhte_backend/tables/_real_time_enabled/shared/shared.dart';

class ExistingCollaborationsStream extends CollaborativeQueries {
  String userUID = '';
  ExistingCollaborationsStream({required super.supabase}) {
    userUID = supabase.auth.currentUser?.id ?? '';
  }

  bool collaboratorSearchListeningStatus = false;
  bool whoIsTalkingListeningStatus = false;
  bool sessionMetadataListeningStatus = false;

  bool isANewCollaboration(events) {
    bool isNew = false;
    for (var event in events) {
      if ((event["collaborator_one"] == userUID ||
              event["collaborator_two"] == userUID) &&
          !event["is_consecrated"] &&
          event["is_currently_active"]) {
        isNew = true;
        break;
      }
    }
    return isNew;
  }

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
          yield true;
        } else {
          yield false;
        }
      } else {
        yield false;
      }
    }
  }

  cancelGetCollaboratorSearchStream() {
    collaboratorSearchListeningStatus = false;
    return collaboratorSearchListeningStatus;
  }

  cancelGetSessionMetadataStream() {
    sessionMetadataListeningStatus = false;
    return sessionMetadataListeningStatus;
  }

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
        final phasesList =
            event.first[ExistingCollaborationsQueries.currentPhases];
        final speakerSpotlight =
            event.first[ExistingCollaborationsQueries.speakerSpotlight];
        yield CollaborationSessionMetadata(
          userIsOnCall: onCallList[userIndex],
          collaboratorIsOnCall: onCallList[collaboratorIndex],
          userIsOnline: isOnlineList[userIndex],
          collaboratorIsOnline: isOnlineList[collaboratorIndex],
          userPhase: double.parse(phasesList[userIndex].toString()),
          collaboratorPhase:
              double.parse(phasesList[collaboratorIndex].toString()),
          timerShouldRun:
              event.first[ExistingCollaborationsQueries.timerShouldRun],
          collaboratorIsTalking:
              speakerSpotlight == collaboratorInfo.theCollaboratorsUID,
          userIsTalking: speakerSpotlight == collaboratorInfo.theUsersUID,
        );
      }
    }
  }
}
