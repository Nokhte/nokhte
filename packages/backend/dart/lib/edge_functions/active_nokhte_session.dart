import 'package:supabase_flutter/supabase_flutter.dart';

import '../tables/_real_time_disabled/st_active_nokhte_sessions/constants.dart';

class ActiveNokhteSessionEdgeFunctions with STActiveNokhteSessionsConstants {
  final SupabaseClient supabase;
  final String userUID;
  ActiveNokhteSessionEdgeFunctions({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';
  String sessionUID = '';
  int userIndex = -1;

  computeCollaboratorInformation() async {
    if (sessionUID.isEmpty) {
      final sessionRes = await supabase
          .from("st_active_nokhte_sessions")
          .select()
          .contains('collaborator_uids', '{$userUID}');
      if (sessionRes.isNotEmpty) {
        sessionUID = sessionRes.first[SESSION_UID];
        userIndex = sessionRes.first[COLLABORATOR_UIDS].indexOf(userUID);
      }
    }
  }

  Future<FunctionResponse> startTheSession() async =>
      await supabase.functions.invoke(
        'nokhte-session-init-or-nuke-or-start',
        body: {
          "userUID": userUID,
          "shouldInitialize": false,
          "shouldStart": true,
        },
      );

  Future<FunctionResponse> initializeSession() async =>
      await supabase.functions.invoke(
        'nokhte-session-init-or-nuke-or-start',
        body: {
          "userUID": userUID,
          "shouldInitialize": true,
          "shouldStart": false,
        },
      );

  Future<FunctionResponse> joinSession(String leaderUID) async =>
      await supabase.functions.invoke(
        'nokhte-session-join',
        body: {
          "userUID": userUID,
          "leaderUID": leaderUID,
        },
      );

  Future<FunctionResponse> nukeSession() async =>
      await supabase.functions.invoke(
        'nokhte-session-init-or-nuke-or-start',
        body: {
          "userUID": userUID,
          "shouldInitialize": false,
          "shouldStart": false,
        },
      );

  Future<FunctionResponse> completeTheSession() async {
    await computeCollaboratorInformation();
    final rtRes = await supabase.from('rt_active_nokhte_sessions').select();
    final stRes = await supabase.from('st_active_nokhte_sessions').select();
    if (stRes.isEmpty && rtRes.isEmpty) {
      return FunctionResponse(
          status: 200, data: {"status": 200, "message": "nothing to see here"});
    } else {
      return await supabase.functions
          .invoke('nokhte-session-complete-the-session', body: {
        'userUID': userUID,
      });
    }
  }
}
