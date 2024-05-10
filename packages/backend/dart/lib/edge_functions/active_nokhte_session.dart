import 'package:nokhte_backend/tables/_real_time_enabled/active_nokhte_sessions/constants/constants.dart';
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
    if (userIndex == -1) {
      final row = (await supabase.from(TABLE).select()).first;
      if (row.isNotEmpty) {
        collaboratorUIDs = row[COLLABORATOR_UIDS];
        formattedCollaboratorUIDs = row[COLLABORATOR_UIDS]
            .toString()
            .replaceAll('[', '{')
            .replaceAll(']', '}');
        userIndex = collaboratorUIDs.indexOf(userUID);
      }
    }
  }

  Future<FunctionResponse> addContent(String newContent) async {
    await computeCollaboratorInformation();
    return await supabase.functions.invoke(
      'nokhte-session-add-content',
      body: {
        'newContent': newContent,
        'collaboratorUIDs': formattedCollaboratorUIDs,
      },
    );
  }

  Future<FunctionResponse> updateOnlineStatus(bool isOnline) async {
    await computeCollaboratorInformation();
    return await supabase.functions.invoke(
      'nokhte-session-update-online-status',
      body: {
        'newOnlineStatus': isOnline,
        'collaboratorUIDs': formattedCollaboratorUIDs,
        'userIndex': userIndex
      },
    );
  }

  Future<FunctionResponse> updateHasGyroscope(bool hasGryoscope) async {
    await computeCollaboratorInformation();
    return await supabase.functions.invoke(
      'nokhte-session-update-has-gyroscope',
      body: {
        'newGyroscopeStatus': hasGryoscope,
        'collaboratorUIDs': formattedCollaboratorUIDs,
        'userIndex': userIndex
      },
    );
  }

  Future<FunctionResponse> updateSpeakerSpotlight({
    required bool addUserToSpotlight,
  }) async {
    await computeCollaboratorInformation();
    return await supabase.functions.invoke(
      'nokhte-session-update-speaker-spotlight',
      body: {
        'addUserToSpotlight': addUserToSpotlight,
        'collaboratorUIDs': formattedCollaboratorUIDs,
        'userUID': userUID
      },
    );
  }

  Future<FunctionResponse> updateCurrentPhases(double newPhase) async {
    await computeCollaboratorInformation();
    return await supabase.functions
        .invoke('nokhte-session-update-current-phase', body: {
      'newPhase': newPhase,
      'collaboratorUIDs': formattedCollaboratorUIDs,
      'userIndex': userIndex,
    });
  }

  Future<FunctionResponse> startTheSession() async {
    await computeCollaboratorInformation();
    return await supabase.functions
        .invoke('nokhte-session-start-the-session', body: {
      'collaboratorUIDs': formattedCollaboratorUIDs,
    });
  }

  Future<FunctionResponse> completeTheSession() async {
    final res = await supabase.from('active_nokhte_sessions').select();
    if (res.isEmpty) {
      return FunctionResponse(status: 200, data: "nothing to see here");
    } else {
      return await supabase.functions
          .invoke('nokhte-session-complete-the-session', body: {
        'collaboratorUIDs': formattedCollaboratorUIDs,
      });
    }
    //
  }
}
