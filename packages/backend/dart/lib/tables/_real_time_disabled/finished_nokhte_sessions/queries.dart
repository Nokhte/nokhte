// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

class FinishedNokhteSessionQueries {
  static const TABLE = 'finished_nokhte_sessions';
  static const COLLABORATOR_UIDS = 'collaborator_uids';
  static const SESSION_TIMESTAMP = 'session_timestamp';
  static const CONTENT = 'content';
  static const ALIASES = 'aliases';
  static const ID = 'id';
  static const SESSION_UID = 'session_uid';

  final SupabaseClient supabase;
  final String userUID;

  FinishedNokhteSessionQueries({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> select() async =>
      await supabase.from(TABLE).select().order('session_timestamp');

  Future<List> selectByCollaborationId(String collaboratorUID) async {
    final sortedCollaboratorUIDs = [userUID, collaboratorUID]..sort();
    return await supabase
        .from(TABLE)
        .select()
        .eq(COLLABORATOR_UIDS, sortedCollaboratorUIDs)
        .order(SESSION_TIMESTAMP);
  }

  Future<List> updateAlias({
    required String newAlias,
    required int id,
  }) async {
    final sessionRes = await supabase.from(TABLE).select().eq(ID, id);
    final aliases = sessionRes.first[ALIASES];
    final userIndex =
        sessionRes.first[COLLABORATOR_UIDS].first == userUID ? 0 : 1;
    aliases[userIndex] = newAlias;
    return await supabase
        .from(TABLE)
        .update({ALIASES: aliases})
        .eq(ID, id)
        .select();
  }
}
