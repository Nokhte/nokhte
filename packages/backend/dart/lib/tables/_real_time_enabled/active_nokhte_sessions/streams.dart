// ignore_for_file: constant_identifier_names

import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/queries.dart';
import 'constants/constants.dart';
import 'types/types.dart';

class ActiveNokhteSessionsStream extends ActiveNokhteSessionQueries
    with ActiveNokhteSessionsConstants {
  bool getActiveNokhteSessionCreationListingingStatus = false;
  bool sessionMetadataListeningStatus = false;

  ActiveNokhteSessionsStream({required super.supabase});
  // : userUID = supabase.auth.currentUser?.id ?? '';

  cancelGetActiveNokhteSessionCreationStatus() {
    getActiveNokhteSessionCreationListingingStatus = false;
    return getActiveNokhteSessionCreationListingingStatus;
  }

  Stream<bool> getActiveNokhteSessionCreationStatus() async* {
    getActiveNokhteSessionCreationListingingStatus = true;
    await for (var event
        in supabase.from(TABLE_NAME).stream(primaryKey: ['id'])) {
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

  Stream<NokhteSessionMetadata> getSessionMetadata() async* {
    sessionMetadataListeningStatus = true;
    await for (var event
        in supabase.from(TABLE_NAME).stream(primaryKey: ['id'])) {
      if (event.isEmpty) {
        yield NokhteSessionMetadata.initial();
      } else {
        await computeCollaboratorInformation();
        final isOnlineList = event.first[IS_ONLINE];
        final phasesList = event.first[CURRENT_PHASES];
        final speakerSpotlight = event.first[SPEAKER_SPOTLIGHT];
        yield NokhteSessionMetadata(
          userIsOnline: isOnlineList[userIndex],
          collaboratorIsOnline: isOnlineList[collaboratorIndex],
          userPhase: double.parse(phasesList[userIndex].toString()),
          collaboratorPhase:
              double.parse(phasesList[collaboratorIndex].toString()),
          collaboratorIsTalking: speakerSpotlight == collaboratorUID,
          userIsTalking: speakerSpotlight == userUID,
        );
      }
    }
  }
}
