// ignore_for_file: constant_identifier_names
import 'package:nokhte_backend/edge_functions/active_nokhte_session.dart';
import 'constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class STActiveNokhteSessionQueries extends ActiveNokhteSessionEdgeFunctions
    with STActiveNokhteSessionsConstants {
  STActiveNokhteSessionQueries({
    required super.supabase,
  });

  Future<List> select() async => await supabase.from(TABLE).select();

  delete() async =>
      await _onCurrentActiveNokhteSession(supabase.from(TABLE).delete());

  Future _getProperty(String property) async =>
      (await select()).first[property];
  Future<String> getCreatedAt() async => await _getProperty(CREATED_AT);
  Future<List> getHasPremiumAccess() async =>
      await _getProperty(HAS_PREMIUM_ACCESS);
  Future<List> getContent() async => await _getProperty(CONTENT);
  Future<List> getHaveGyroscopes() async => await _getProperty(HAVE_GYROSCOPES);
  Future<String> getSessionUID() async => await _getProperty(SESSION_UID);
  Future<String> getLeaderUID() async => await _getProperty(LEADER_UID);

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
      return await query.eq(SESSION_UID, sessionUID).select();
    } else {
      return [];
    }
  }
}
