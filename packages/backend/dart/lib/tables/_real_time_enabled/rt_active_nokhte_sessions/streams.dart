// ignore_for_file: constant_identifier_names
import 'constants.dart';
import 'types/types.dart';
import 'queries.dart';
import 'package:nokhte_backend/tables/company_presets.dart';

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
  List shouldSkipInstructions = [];
  bool isWhitelisted = false;
  String leaderUID = '';
  List<SessionTags> tags = [];

  final CompanyPresetsQueries presetsQueries;
  RTActiveNokhteSessionsStream({required super.supabase})
      : presetsQueries = CompanyPresetsQueries(supabase: supabase);

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
        yield event.first[CURRENT_PHASES].length > 1;
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
      if (event.isNotEmpty) {
        yield NokhteSessionMetadata(
          phases: event.first[CURRENT_PHASES],
          userCanSpeak: event.first[SPEAKER_SPOTLIGHT] == null,
          userIsSpeaking: event.first[SPEAKER_SPOTLIGHT] == userUID,
          sessionHasBegun: event.first[HAS_BEGUN],
          everyoneIsOnline: event.first[IS_ONLINE].every((e) => e == true),
        );
      }
    }
  }
}
