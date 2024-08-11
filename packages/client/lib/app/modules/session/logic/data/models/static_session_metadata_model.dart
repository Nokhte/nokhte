// ignore_for_file: non_constant_identifier_names

import 'package:nokhte/app/modules/session/logic/domain/domain.dart';
import 'package:nokhte_backend/tables/st_active_nokhte_sessions.dart';
import 'package:nokhte_backend/tables/user_metadata.dart';

class StaticSessionMetadataModel extends StaticSessionMetadataEntity {
  const StaticSessionMetadataModel({
    required super.userIndex,
    required super.isAPremiumSession,
    required super.presetUID,
    required super.leaderUID,
  });

  factory StaticSessionMetadataModel.fromSupabase(
    List sessionRes,
    List metadataRes,
  ) {
    if (sessionRes.isEmpty) {
      return const StaticSessionMetadataModel(
        userIndex: 0,
        isAPremiumSession: false,
        presetUID: '',
        leaderUID: '',
      );
    } else {
      final m = UserMetadataConstants();
      final UID = m.UID;
      final LEADER_UID = STActiveNokhteSessionsConstants.S_LEADER_UID;
      final COLLABORATOR_UIDS =
          STActiveNokhteSessionsConstants.S_COLLABORATOR_UIDS;
      final PRESET_UID = STActiveNokhteSessionsConstants.S_PRESET_UID;
      final leaderUID = sessionRes.first[LEADER_UID];
      final orderedCollaboratorUIDs = sessionRes.first[COLLABORATOR_UIDS];
      final userIndex = orderedCollaboratorUIDs.indexOf(metadataRes.first[UID]);
      final isAPremiumSession = sessionRes.first[COLLABORATOR_UIDS].length > 3;
      final presetUID = sessionRes.first[PRESET_UID];
      return StaticSessionMetadataModel(
        leaderUID: leaderUID,
        presetUID: presetUID,
        userIndex: userIndex,
        isAPremiumSession: isAPremiumSession,
      );
    }
  }
}
