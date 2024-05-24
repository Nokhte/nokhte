// ignore_for_file: constant_identifier_names
import 'constants.dart';
import 'types/types.dart';
import 'queries.dart';

class RTActiveNokhteSessionsStream extends RTActiveNokhteSessionQueries
    with RTActiveNokhteSessionsConstants {
  bool getActiveNokhteSessionCreationListingingStatus = false;
  bool sessionMetadataListeningStatus = false;
  int lastTrackedNumOfCollaborators = -1;
  int leaderIndex = -1;
  List orderedCollaboratorUIDs = [];
  List orderedPhases = [];
  bool isAValidSession = false;
  bool isAPremiumSession = false;
  bool everyoneHasGyroscopes = false;

  RTActiveNokhteSessionsStream({required super.supabase});

  static List<T> createLoopingList<T>(List<T> originalList, int startIndex) {
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

  cancelSessionActivationStream() {
    getActiveNokhteSessionCreationListingingStatus = false;
    return getActiveNokhteSessionCreationListingingStatus;
  }

  Stream<bool> listenToSessionActivationStatus() async* {
    getActiveNokhteSessionCreationListingingStatus = true;
    await for (var event in supabase.from(TABLE).stream(primaryKey: ['id'])) {
      if (!getActiveNokhteSessionCreationListingingStatus) {
        break;
      }
      if (event.isNotEmpty) {
        if (event.first[CURRENT_PHASES].length > 1) {
          yield true;
        } else {
          yield false;
        }
      } else {
        yield false;
      }
    }
  }

  cancelGetSessionMetadataStream() {
    sessionMetadataListeningStatus = false;
    return sessionMetadataListeningStatus;
  }

  Stream<NokhteSessionMetadata> listenToPresenceMetadata() async* {
    sessionMetadataListeningStatus = true;
    await for (var event in supabase
        .from("rt_active_nokhte_sessions")
        .stream(primaryKey: ['id'])) {
      if (event.isEmpty) {
        yield NokhteSessionMetadata.initial();
      } else {
        await computeCollaboratorInformation();
        if (lastTrackedNumOfCollaborators !=
            event.first[CURRENT_PHASES].length) {
          lastTrackedNumOfCollaborators = event.first[CURRENT_PHASES].length;
          final res = await supabase.from('st_active_nokhte_sessions').select();
          leaderIndex =
              res.first[COLLABORATOR_UIDS].indexOf(event.first[LEADER_UID]);
          orderedCollaboratorUIDs =
              createLoopingList(res.first[COLLABORATOR_UIDS], leaderIndex);
          userIndex = orderedCollaboratorUIDs.indexOf(userUID);
          isAValidSession = res.first[HAS_PREMIUM_ACCESS].length < 4 ||
              res.first[HAS_PREMIUM_ACCESS].every((e) => e == true);
          isAPremiumSession = res.first[COLLABORATOR_UIDS].length > 3;
          everyoneHasGyroscopes =
              res.first[HAVE_GYROSCOPES].every((e) => e == true);
        }
        orderedPhases = createLoopingList(
          event.first[CURRENT_PHASES],
          leaderIndex,
        );
        yield NokhteSessionMetadata(
          isAValidSession: isAValidSession,
          isAPremiumSession: isAPremiumSession,
          everyoneHasGyroscopes: everyoneHasGyroscopes,
          userIndex: userIndex,
          phases: orderedPhases,
          userCanSpeak: event.first[SPEAKER_SPOTLIGHT] == null,
          userIsSpeaking: event.first[SPEAKER_SPOTLIGHT] == userUID,
          sessionHasBegun: event.first[HAS_BEGUN],
          everyoneIsOnline: event.first[IS_ONLINE].every((e) => e == true),
        );
      }
    }
  }
}
