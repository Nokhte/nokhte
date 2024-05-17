// ignore_for_file: constant_identifier_names
import 'package:nokhte_backend/edge_functions/active_nokhte_session.dart';
import 'constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveNokhteSessionQueries extends ActiveNokhteSessionEdgeFunctions
    with ActiveNokhteSessionsConstants {
  ActiveNokhteSessionQueries({
    required super.supabase,
  });

  select() async => await supabase.from(TABLE).select();

  delete() async =>
      await _onCurrentActiveNokhteSession(supabase.from(TABLE).delete());

  Future _getProperty(String property) async =>
      (await select()).first[property];
  Future<List> getWhoIsOnline() async => await _getProperty(IS_ONLINE);
  Future<String?> getSpeakerSpotlight() async =>
      await _getProperty(SPEAKER_SPOTLIGHT);
  Future<List> getCurrentPhases() async => await _getProperty(CURRENT_PHASES);
  Future<String> getCreatedAt() async => await _getProperty(CREATED_AT);
  Future<int> getMetadataIndex() async => await _getProperty(METADATA_INDEX);
  Future<bool> getIsAValidSession() async =>
      await _getProperty(IS_A_VALID_SESSION);
  Future<List> getContent() async => await _getProperty(CONTENT);
  Future<List> getHaveGyroscopes() async => await _getProperty(HAVE_GYROSCOPES);
  Future<String> getSessionUID() async => await _getProperty(SESSION_UID);
  Future<String> getLeaderUID() async => await _getProperty(LEADER_UID);
  Future<bool> getHasBegun() async => await _getProperty(HAS_BEGUN);

  Future<List> updateOnlineStatus(bool isOnlineParam) async {
    await computeCollaboratorInformation();
    final currentOnlineStatus = await getWhoIsOnline();
    currentOnlineStatus[userIndex] = isOnlineParam;
    return await _onCurrentActiveNokhteSession(supabase.from(TABLE).update({
      IS_ONLINE: currentOnlineStatus,
    }));
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

  Future<List> addContent(String content) async {
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
    required bool addUserToSpotlight,
  }) async {
    await computeCollaboratorInformation();
    final currentSpotlightSpeaker = await getSpeakerSpotlight();
    if (addUserToSpotlight) {
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
