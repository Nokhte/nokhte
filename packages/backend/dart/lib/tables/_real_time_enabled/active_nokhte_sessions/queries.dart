// ignore_for_file: constant_identifier_names

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

  select() async => await supabase.from(TABLE_NAME).select();

  delete() async => await supabase
      .from(TABLE_NAME)
      .delete()
      .or('collaborator_one_uid.eq.$userUID, collaborator_two_uid.eq.$userUID')
      .select();

  Future _getProperty(String property) async =>
      (await select()).first[property];

  Future<String> getMeetingUID() async => await _getProperty(MEETING_UID);
  Future<String> getCollaboratorOne() async =>
      await _getProperty(COLLABORATOR_ONE_UID);
  Future<String> getCollaboratorTwo() async =>
      await _getProperty(COLLABORATOR_TWO_UID);
  Future<List> getWhoIsOnline() async => await _getProperty(IS_ONLINE);
  Future<String?> getSpeakerSpotlight() async =>
      await _getProperty(SPEAKER_SPOTLIGHT);
  Future<List> getCurrentPhases() async => await _getProperty(CURRENT_PHASES);

  Future<List> updateOnlineStatus(
    bool isOnlineParam, {
    bool shouldEditCollaboratorsInfo = false,
  }) async {
    await computeCollaboratorInformation();
    final currentOnlineStatus = await getWhoIsOnline();
    final indexToEdit =
        shouldEditCollaboratorsInfo ? collaboratorIndex : userIndex;
    currentOnlineStatus[indexToEdit] = isOnlineParam;
    return await _onCurrentActiveNokhteSession(
        supabase.from(TABLE_NAME).update({
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
    return await _onCurrentActiveNokhteSession(
        supabase.from(TABLE_NAME).update({
      CURRENT_PHASES: currentPhases,
    }));
  }

  Future<List> setUserAsTheCurrentTalker() async {
    await computeCollaboratorInformation();
    final currentSpeaker = await getSpeakerSpotlight();
    if (currentSpeaker == null) {
      return await _onCurrentActiveNokhteSession(
        supabase.from(TABLE_NAME).update({
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
          supabase.from(TABLE_NAME).update({SPEAKER_SPOTLIGHT: null}));
    } else {
      return [];
    }
  }

  Future<bool> checkIfUserHasTheQuestion() async {
    await computeCollaboratorInformation();
    final meetingUID = await getMeetingUID();
    return meetingUID == userUID;
  }

  _onCurrentActiveNokhteSession(PostgrestFilterBuilder query) async {
    await computeCollaboratorInformation();
    return await query
        .eq(userColumn, userUID)
        .eq(collaboratorColumn, collaboratorUID)
        .select();
  }
}
