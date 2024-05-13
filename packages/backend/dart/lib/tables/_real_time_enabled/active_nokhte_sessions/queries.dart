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

  _onCurrentActiveNokhteSession(PostgrestFilterBuilder query) async {
    await computeCollaboratorInformation();
    if (userIndex != -1) {
      return await query.eq(COLLABORATOR_UIDS, collaboratorUIDs).select();
    } else {
      return [];
    }
  }
}
