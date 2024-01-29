// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

class FinishedNokhteSessionQueries {
  static const TABLE_NAME = 'finished_nokhte_sessions';
  static const COLLABORATOR_ONE_UID = 'collaborator_one_uid';
  static const COLLABORATOR_TWO_UID = 'collaborator_two_uid';

  final SupabaseClient supabase;
  final String userUID;

  FinishedNokhteSessionQueries({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  Future<List> insert({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async =>
      await supabase.from(TABLE_NAME).insert({
        COLLABORATOR_ONE_UID: collaboratorOneUID,
        COLLABORATOR_TWO_UID: collaboratorTwoUID,
      }).select();

  Future<List> select({
    required String collaboratorOneUID,
    required String collaboratorTwoUID,
  }) async =>
      await supabase
          .from(TABLE_NAME)
          .select()
          .eq(
            COLLABORATOR_ONE_UID,
            collaboratorOneUID,
          )
          .eq(
            COLLABORATOR_TWO_UID,
            collaboratorTwoUID,
          );
}