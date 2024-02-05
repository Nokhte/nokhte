// ignore_for_file: constant_identifier_names
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveNokhteSessionQueries with ActiveNokhteSessionsConstants {
  final SupabaseClient supabase;
  final String userUID;
  int userIndex = -1;
  int collaboratorIndex = -1;
  String collaboratorUID = '';
  String timestamp = '';
  String collaboratorOneUID = '';
  String collaboratorTwoUID = '';
  List collaboratorUIDs = [];

  computeCollaboratorInformation() async {
    if (userIndex == -1) {
      final row = (await select()).first;
      if (row[COLLABORATOR_UIDS][0] == userUID) {
        collaboratorUIDs = row[COLLABORATOR_UIDS];
        userIndex = 0;
        collaboratorOneUID = userUID;
        collaboratorTwoUID = row[COLLABORATOR_UIDS][1];
        collaboratorIndex = 1;
        collaboratorUID = row[COLLABORATOR_UIDS][1];
      } else {
        collaboratorTwoUID = userUID;
        collaboratorOneUID = row[COLLABORATOR_UIDS][0];
        userIndex = 1;
        collaboratorIndex = 0;
        collaboratorUID = row[COLLABORATOR_UIDS][0];
      }
    }
  }

  ActiveNokhteSessionQueries({
    required this.supabase,
  }) : userUID = supabase.auth.currentUser?.id ?? '';

  select() async => await supabase.from(TABLE).select();

  delete() async =>
      await _onCurrentActiveNokhteSession(supabase.from(TABLE).delete());

  Future _getProperty(String property) async =>
      (await select()).first[property];

  Future<String> getMeetingUID() async => await _getProperty(MEETING_UID);
  Future<String> getCollaboratorOne() async =>
      (await _getProperty(COLLABORATOR_UIDS))[0];
  Future<String> getCollaboratorTwo() async =>
      (await _getProperty(COLLABORATOR_UIDS))[1];
  Future<List> getWhoIsOnline() async => await _getProperty(IS_ONLINE);
  Future<String?> getSpeakerSpotlight() async =>
      await _getProperty(SPEAKER_SPOTLIGHT);
  Future<List> getCurrentPhases() async => await _getProperty(CURRENT_PHASES);
  Future<String> getCreatedAt() async => await _getProperty(CREATED_AT);
  Future<int> getMetadataIndex() async => await _getProperty(METADATA_INDEX);
  Future<List> getSessionMetadata() async =>
      await _getProperty(SESSION_METADATA);

  Future<List> updateOnlineStatus(
    bool isOnlineParam, {
    bool shouldEditCollaboratorsInfo = false,
  }) async {
    await computeCollaboratorInformation();
    final currentOnlineStatus = await getWhoIsOnline();
    final indexToEdit =
        shouldEditCollaboratorsInfo ? collaboratorIndex : userIndex;
    currentOnlineStatus[indexToEdit] = isOnlineParam;
    return await _onCurrentActiveNokhteSession(supabase.from(TABLE).update({
      IS_ONLINE: currentOnlineStatus,
    }));
  }

  Future<List> updateCurrentPhases(
    double newPhase, {
    bool shouldEditCollaboratorsInfo = false,
  }) async {
    await computeCollaboratorInformation();
    final currentPhases = await getCurrentPhases();
    final indexToEdit =
        shouldEditCollaboratorsInfo ? collaboratorIndex : userIndex;
    currentPhases[indexToEdit] = newPhase;
    return await _onCurrentActiveNokhteSession(supabase.from(TABLE).update({
      CURRENT_PHASES: currentPhases,
    }));
  }

  Future<List> setUserAsTheCurrentTalker() async {
    await computeCollaboratorInformation();
    final currentSpeaker = await getSpeakerSpotlight();
    if (currentSpeaker == null) {
      return await _onCurrentActiveNokhteSession(
        supabase.from(TABLE).update({
          SPEAKER_SPOTLIGHT: userUID,
        }),
      );
    } else {
      return [];
    }
  }

  Future<List> clearTheCurrentTalker() async {
    await computeCollaboratorInformation();
    final currentSpeaker = await getSpeakerSpotlight();
    if (currentSpeaker == userUID) {
      return await _onCurrentActiveNokhteSession(
          supabase.from(TABLE).update({SPEAKER_SPOTLIGHT: null}));
    } else {
      return [];
    }
  }

  Future<bool> checkIfUserHasTheQuestion() async {
    await computeCollaboratorInformation();
    final meetingUID = await getMeetingUID();
    return meetingUID == userUID;
  }

  Future<String> composePath(String audioID) async {
    await computeCollaboratorInformation();
    if (timestamp.isEmpty) {
      timestamp = await getCreatedAt();
    }
    return '${collaboratorOneUID}_$collaboratorTwoUID/$timestamp/$audioID.wav';
  }

  Future<List> incrementMetadataIndex() async {
    await computeCollaboratorInformation();
    final currentMetadataIndex = await getMetadataIndex();
    return await _onCurrentActiveNokhteSession(
      supabase.from(TABLE).update({
        METADATA_INDEX: currentMetadataIndex + 1,
      }),
    );
  }

  addNewAudioClipToSessionMetadata(String newAudioID) async {
    await computeCollaboratorInformation();
    final currentSessionMetadata = await getSessionMetadata();
    currentSessionMetadata.add({
      'audioID': newAudioID,
      'content': '',
    });
    if (currentSessionMetadata.length > 1) {
      await incrementMetadataIndex();
    }
    return await _onCurrentActiveNokhteSession(
      supabase.from(TABLE).update(
        {
          SESSION_METADATA: currentSessionMetadata,
        },
      ),
    );
  }

  _onCurrentActiveNokhteSession(PostgrestFilterBuilder query) async {
    await computeCollaboratorInformation();
    return await query.eq(COLLABORATOR_UIDS, collaboratorUIDs).select();
  }
}
