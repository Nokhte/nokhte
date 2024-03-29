// ignore_for_file: constant_identifier_names
import 'constants/constants.dart';
import 'types/types.dart';
import 'queries.dart';

class ActiveIrlNokhteSessionsStream extends ActiveIrlNokhteSessionQueries
    with ActiveIrlNokhteSessionsConstants {
  bool getActiveNokhteSessionCreationListingingStatus = false;
  bool sessionMetadataListeningStatus = false;

  ActiveIrlNokhteSessionsStream({required super.supabase});

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

  Stream<IrlNokhteSessionMetadata> getPresenceMetadata() async* {
    sessionMetadataListeningStatus = true;
    await for (var event in supabase.from(TABLE).stream(primaryKey: ['id'])) {
      if (event.isEmpty) {
        yield IrlNokhteSessionMetadata.initial();
      } else {
        await computeCollaboratorInformation();
        final isOnlineList = event.first[IS_ONLINE];
        final phasesList = event.first[CURRENT_PHASES];
        final haveGyroscopesList = event.first[HAVE_GYROSCOPES];
        yield IrlNokhteSessionMetadata(
          userHasGyroscope: haveGyroscopesList[userIndex],
          collaboratorHasGyroscope: haveGyroscopesList[collaboratorIndex],
          userIsOnline: isOnlineList[userIndex],
          collaboratorIsOnline: isOnlineList[collaboratorIndex],
          userPhase: double.parse(phasesList[userIndex].toString()),
          collaboratorPhase:
              double.parse(phasesList[collaboratorIndex].toString()),
        );
      }
    }
  }
}
