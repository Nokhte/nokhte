// ignore_for_file: constant_identifier_names

import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveNokhteSessionQueries {
  static const TABLE_NAME = 'active_nokhte_sessions';
  static const COLLABORATOR_ONE_UID = 'collaborator_one_uid';
  static const COLLABORATOR_TWO_UID = 'collaborator_two_uid';
  static const MEETING_UID = 'meeting_uid';

  final SupabaseClient supabase;

  ActiveNokhteSessionQueries({
    required this.supabase,
  });

  select(String meetingUID) async =>
      await supabase.from(TABLE_NAME).select().eq(MEETING_UID, meetingUID);
}
