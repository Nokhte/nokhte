// ignore_for_file: constant_identifier_names
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveIrlNokhteSessionQueries with ActiveIrlNokhteSessionsConstants {
  FinishedNokhteSessionQueries finishedNokhteSessionQueries;
  final SupabaseClient supabase;
  final String userUID;
  int userIndex = -1;
  List collaboratorUIDs = [];

  computeCollaboratorInformation() async {
    if (userIndex == -1) {
      final res = (await select());
      if (res.isNotEmpty) {
        final row = res.first;
        collaboratorUIDs = row[COLLABORATOR_UIDS];
        for (int i = 0; i < collaboratorUIDs.length; i++) {
          if (collaboratorUIDs[i] == userUID) {
            userIndex = i;
          }
        }
      }
    }
  }

  ActiveIrlNokhteSessionQueries({
    required this.supabase,
  })  : userUID = supabase.auth.currentUser?.id ?? '',
        finishedNokhteSessionQueries =
            FinishedNokhteSessionQueries(supabase: supabase);

  select() async => await supabase.from(TABLE).select();

  delete() async =>
      await _onCurrentActiveNokhteSession(supabase.from(TABLE).delete());

  Future _getProperty(String property) async =>
      (await select()).first[property];

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
  Future<List> getContent() async => await _getProperty(CONTENT);
  Future<List> getHaveGyroscopes() async => await _getProperty(HAVE_GYROSCOPES);
  Future<String> getSessionUID() async => await _getProperty(SESSION_UID);
  Future<String> getLeaderUID() async => await _getProperty(LEADER_UID);

  Future<List> updateOnlineStatus(bool isOnlineParam) async {
    await computeCollaboratorInformation();
    final currentOnlineStatus = await getWhoIsOnline();
    currentOnlineStatus[userIndex] = isOnlineParam;
    return await _onCurrentActiveNokhteSession(supabase.from(TABLE).update({
      IS_ONLINE: currentOnlineStatus,
    }));
  }

  Future<List> startTheSession() async {
    await computeCollaboratorInformation();
    return await _onCurrentActiveNokhteSession(
      supabase.from(TABLE).update({
        HAS_BEGUN: true,
      }),
    );
  }

  Future<List> updateCurrentPhases(double newPhase) async {
    await computeCollaboratorInformation();
    await supabase.rpc('update_nokhte_session_phase', params: {
      'incoming_uids': collaboratorUIDs,
      'index_to_edit': userIndex,
      'new_value': newPhase,
    });
    return [];
  }

  addContent(String content) async {
    await computeCollaboratorInformation();
    final currentContent = await getContent();
    currentContent.add(content);
    return await _onCurrentActiveNokhteSession(
      supabase.from(TABLE).update({
        CONTENT: currentContent,
      }),
    );
  }

  Future<List> updateSpeakerSpotlight({
    required bool addUserToSpotight,
  }) async {
    await computeCollaboratorInformation();
    final currentSpotlightSpeaker = await getSpeakerSpotlight();
    if (addUserToSpotight) {
      if (currentSpotlightSpeaker == null) {
        return await _onCurrentActiveNokhteSession(
          supabase.from(TABLE).update({
            SPEAKER_SPOTLIGHT: userUID,
          }),
        );
      } else {
        return [];
      }
    } else {
      if (currentSpotlightSpeaker == userUID) {
        return await _onCurrentActiveNokhteSession(
          supabase.from(TABLE).update({
            SPEAKER_SPOTLIGHT: null,
          }),
        );
      } else {
        return [];
      }
    }
  }

  Future<List> completeTheSession() async {
    await computeCollaboratorInformation();
    if (userIndex == -1) return [];
    final content = await getContent();
    final sessionTimestamp = await getCreatedAt();
    final sessionUID = await getSessionUID();
    await finishedNokhteSessionQueries.insert(
      sessionUID: sessionUID,
      collaboratorUIDs: collaboratorUIDs,
      sessionContent: content,
      sessionTimestamp: sessionTimestamp,
    );
    await delete();
    return [];
  }

  Future<List> updateHasGyroscope(bool newStatus) async {
    await computeCollaboratorInformation();
    final currentHaveGyroscopees = await getHaveGyroscopes();
    currentHaveGyroscopees[userIndex] = newStatus;
    return await _onCurrentActiveNokhteSession(
      supabase.from(TABLE).update(
        {
          HAVE_GYROSCOPES: currentHaveGyroscopees,
        },
      ),
    );
  }

  _onCurrentActiveNokhteSession(PostgrestFilterBuilder query) async {
    await computeCollaboratorInformation();
    if (userIndex != -1) {
      return await query.eq(COLLABORATOR_UIDS, collaboratorUIDs).select();
    } else {
      return [];
    }
  }
}
