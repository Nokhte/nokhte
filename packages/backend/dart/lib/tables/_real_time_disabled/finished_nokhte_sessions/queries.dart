// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

class FinishedNokhteSessionQueries {
  static const TABLE = 'finished_nokhte_sessions';
  static const COLLABORATOR_UIDS = 'collaborator_uids';
  static const SESSION_TIMESTAMP = 'session_timestamp';
  static const CONTENT = 'content';

  final SupabaseClient supabase;
  final String userUID;

  FinishedNokhteSessionQueries({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> insert({
    required List<String> collaboratorUIDs,
    required List<String> sessionContent,
    required String sessionTimestamp,
  }) async =>
      await supabase.from(TABLE).insert({
        COLLABORATOR_UIDS: collaboratorUIDs,
        CONTENT: sessionContent,
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
}
