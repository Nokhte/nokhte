// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

class FinishedNokhteSessionQueries {
  static const TABLE = 'finished_nokhte_sessions';
  static const COLLABORATOR_UIDS = 'collaborator_uids';
  static const SESSION_TIMESTAMP = 'session_timestamp';
  static const SESSION_METADATA = 'session_metadata';

  final SupabaseClient supabase;
  final String userUID;

  FinishedNokhteSessionQueries({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> insert({
    required List<String> collaboratorUIDs,
    required List<Map> sessionMetadata,
    required String sessionTimestamp,
  }) async =>
      await supabase.from(TABLE).insert({
        COLLABORATOR_UIDS: collaboratorUIDs,
        SESSION_METADATA: sessionMetadata,
        SESSION_TIMESTAMP: sessionTimestamp,
      }).select();

  Future<List> select() async => await supabase.from(TABLE).select();

  Future<List> selectByCollaborationId(String collaboratorUID) async {
    final sortedCollaboratorUIDs = [userUID, collaboratorUID]..sort();
    return await supabase
        .from(TABLE)
        .select()
        .eq(COLLABORATOR_UIDS, sortedCollaboratorUIDs);
  }

  Future<List<String>> getAudioPathsFromSession(
      String collaboratorUID, int sessionIndex) async {
    final sessions = await selectByCollaborationId(collaboratorUID);
    if (sessions.isEmpty) {
      return [];
    } else {
      final List<String> paths = [];
      final session = sessions[sessionIndex];
      final collaboratorIDs = session[COLLABORATOR_UIDS].join('_');
      final sessionTimestamp = session[SESSION_TIMESTAMP];
      final sessionMetadata = session[SESSION_METADATA];
      for (int i = 0; i < sessionMetadata.length; i++) {
        paths.add(
          '$collaboratorIDs/$sessionTimestamp/${sessionMetadata[i]["audioID"]}.wav',
        );
      }
      return paths;
    }
  }
}
