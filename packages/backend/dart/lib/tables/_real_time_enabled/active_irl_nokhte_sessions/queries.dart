// ignore_for_file: constant_identifier_names
import 'package:nokhte_backend/tables/finished_nokhte_sessions.dart';
import 'constants/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveIrlNokhteSessionQueries with ActiveIrlNokhteSessionsConstants {
  FinishedNokhteSessionQueries finishedNokhteSessionQueries;
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
      final res = (await select());
      if (res.isNotEmpty) {
        final row = res.first;
        collaboratorUIDs = row[COLLABORATOR_UIDS];
        if (row[COLLABORATOR_UIDS][0] == userUID) {
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

  Future<List> startTheSession() async {
    await computeCollaboratorInformation();
    return await _onCurrentActiveNokhteSession(
      supabase.from(TABLE).update({
        HAS_BEGUN: true,
      }),
    );
  }

  Future<List> updateCurrentPhases(
    double newPhase, {
    bool shouldEditCollaboratorsInfo = false,
  }) async {
    await computeCollaboratorInformation();
    await supabase.rpc('update_nokhte_session_phase', params: {
      'incoming_uids': collaboratorUIDs,
      'index_to_edit':
          shouldEditCollaboratorsInfo ? collaboratorIndex : userIndex,
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
