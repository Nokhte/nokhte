// ignore_for_file: constant_identifier_names
import 'package:nokhte_backend/edge_functions/active_nokhte_session.dart';
import 'package:nokhte_backend/types/types.dart';
import 'package:nokhte_backend/utils/utils.dart';
import 'constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class STActiveNokhteSessionQueries extends ActiveNokhteSessionEdgeFunctions
    with STActiveNokhteSessionsConstants, SessionUtils {
  STActiveNokhteSessionQueries({
    required super.supabase,
  });

  Future<List> select() async => await supabase.from(TABLE).select();

  Future<SessionResponse<T>> _getProperty<T>(String property) async {
    final row = (await select()).first;
    T prop = row[property];
    final version = row[VERSION];
    return SessionResponse<T>(
      mainType: prop,
      currentVersion: version,
    );
  }

  Future<SessionResponse<String>> getCreatedAt() async =>
      await _getProperty<String>(CREATED_AT);
  Future<SessionResponse<List>> getContent() async =>
      await _getProperty<List>(CONTENT);
  Future<SessionResponse<String>> getSessionUID() async =>
      await _getProperty<String>(SESSION_UID);
  Future<SessionResponse<String>> getLeaderUID<String>() async =>
      await _getProperty(LEADER_UID);

  Future<List> addContent(String content) async {
    await computeCollaboratorInformation();
    final contentRes = await getContent();
    final currentContent = contentRes.mainType;
    final currentVersion = contentRes.currentVersion;
    currentContent.add(content);

    return await retry<List>(
      action: () async {
        return await _onCurrentActiveNokhteSession(
          supabase.from(TABLE).update({
            CONTENT: currentContent,
          }),
          version: currentVersion,
        );
      },
      shouldRetry: (result) {
        return result.isEmpty;
      },
    );
  }

  _onCurrentActiveNokhteSession(
    PostgrestFilterBuilder query, {
    required int version,
  }) async {
    await computeCollaboratorInformation();
    if (userIndex != -1) {
      return await query
          .eq(SESSION_UID, sessionUID)
          .eq(VERSION, version)
          .select();
    } else {
      return [];
    }
  }
}
