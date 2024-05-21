import 'package:nokhte_backend/tables/active_nokhte_sessions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ActiveNokhteSessionEdgeFunctions with ActiveNokhteSessionsConstants {
  final SupabaseClient supabase;
  final String userUID;
  int userIndex = -1;
  String formattedCollaboratorUIDs = '';
  List collaboratorUIDs = [];
  ActiveNokhteSessionEdgeFunctions({required this.supabase})
      : userUID = supabase.auth.currentUser?.id ?? '';

  computeCollaboratorInformation() async {
    if (userIndex == -1 || collaboratorUIDs.length < 2) {
      final row = (await supabase.from(TABLE).select());
      if (row.isNotEmpty) {
        collaboratorUIDs = row.first[COLLABORATOR_UIDS];
        formattedCollaboratorUIDs = row.first[COLLABORATOR_UIDS]
            .toString()
            .replaceAll('[', '{')
            .replaceAll(']', '}');
        userIndex = collaboratorUIDs.indexOf(userUID);
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
    final res = await supabase.from('active_nokhte_sessions').select();
    if (res.isEmpty) {
      return FunctionResponse(
          status: 200, data: {"status": 200, "message": "nothing to see here"});
    } else {
      return await supabase.functions
          .invoke('nokhte-session-complete-the-session', body: {
        'collaboratorUIDs': formattedCollaboratorUIDs,
      });
    }
  }
}
