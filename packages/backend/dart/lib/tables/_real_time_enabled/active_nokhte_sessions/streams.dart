// ignore_for_file: constant_identifier_names
import 'constants/constants.dart';
import 'types/types.dart';
import 'queries.dart';

class ActiveNokhteSessionsStream extends ActiveNokhteSessionQueries
    with ActiveNokhteSessionsConstants {
  bool getActiveNokhteSessionCreationListingingStatus = false;
  bool sessionMetadataListeningStatus = false;

  ActiveNokhteSessionsStream({required super.supabase});

  List<T> createLoopingList<T>(List<T> originalList, int startIndex) {
    List<T> loopingList = [];
    int length = originalList.length;
    startIndex = startIndex % length;
    for (int i = startIndex; i < length; i++) {
      loopingList.add(originalList[i]);
    }
    for (int i = 0; i < startIndex; i++) {
      loopingList.add(originalList[i]);
    }
    return loopingList;
  }

  cancelGetActiveNokhteSessionCreationStatus() {
    getActiveNokhteSessionCreationListingingStatus = false;
    return getActiveNokhteSessionCreationListingingStatus;
  }

  Stream<bool> getActiveNokhteSessionCreationStatus() async* {
    getActiveNokhteSessionCreationListingingStatus = true;
    await for (var event in supabase.from(TABLE).stream(primaryKey: ['id'])) {
      if (!getActiveNokhteSessionCreationListingingStatus) {
        break;
      }
      if (event.isNotEmpty) {
        yield true;
      } else {
        yield false;
      }
    }
  }

  cancelGetSessionMetadataStream() {
    sessionMetadataListeningStatus = false;
    return sessionMetadataListeningStatus;
  }

  Stream<NokhteSessionMetadata> getPresenceMetadata() async* {
    sessionMetadataListeningStatus = true;
    await for (var event in supabase.from(TABLE).stream(primaryKey: ['id'])) {
      if (event.isEmpty) {
        yield NokhteSessionMetadata.initial();
      } else {
        await computeCollaboratorInformation();
        final leaderIndex =
            event.first[COLLABORATOR_UIDS].indexOf(event.first[LEADER_UID]);
        final orderedCollaboratorUIDs =
            createLoopingList(event.first[COLLABORATOR_UIDS], leaderIndex);
        final orderedPhases = createLoopingList(
          event.first[CURRENT_PHASES],
          leaderIndex,
        );
        final userIndex = orderedCollaboratorUIDs.indexOf(userUID);
        yield NokhteSessionMetadata(
          isAPremiumSession: event.first[COLLABORATOR_UIDS].length > 3,
          userCanSpeak: event.first[SPEAKER_SPOTLIGHT] == null,
          userIsSpeaking: event.first[SPEAKER_SPOTLIGHT] == userUID,
          userIndex: userIndex,
          sessionHasBegun: event.first[HAS_BEGUN],
          everyoneHasGyroscopes:
              event.first[HAVE_GYROSCOPES].every((e) => e == true),
          everyoneIsOnline: event.first[IS_ONLINE].every((e) => e == true),
          phases: orderedPhases,
        );
      }
    }
  }
}
