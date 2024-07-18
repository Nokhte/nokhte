// ignore_for_file: non_constant_identifier_names

import 'package:nokhte/app/modules/session/logic/domain/domain.dart';
import 'package:nokhte_backend/tables/st_active_nokhte_sessions.dart';

class StaticSessionMetadataModel extends StaticSessionMetadataEntity {
  const StaticSessionMetadataModel({
    required super.userIndex,
    required super.isAPremiumSession,
    required super.leaderIsWhitelisted,
    required super.isAValidSession,
    required super.presetUID,
    required super.leaderUID,
  });

  factory StaticSessionMetadataModel.fromSupabase(List res, String userUID) {
    if (res.isEmpty) {
      return const StaticSessionMetadataModel(
        userIndex: 0,
        isAPremiumSession: false,
        leaderIsWhitelisted: false,
        presetUID: '',
        leaderUID: '',
        isAValidSession: false,
      );
    } else {
      final LEADER_UID = STActiveNokhteSessionsConstants.S_LEADER_UID;
      final COLLABORATOR_UIDS =
          STActiveNokhteSessionsConstants.S_COLLABORATOR_UIDS;
      final HAS_PREMIUM_ACCESS =
          STActiveNokhteSessionsConstants.S_HAS_PREMIUM_ACCESS;
      final IS_WHITELISTED = STActiveNokhteSessionsConstants.S_IS_WHITELISTED;
      final PRESET_UID = STActiveNokhteSessionsConstants.S_PRESET_UID;
      final leaderUID = res.first[LEADER_UID];
      final orderedCollaboratorUIDs = res.first[COLLABORATOR_UIDS];
      final userIndex = orderedCollaboratorUIDs.indexOf(userUID);
      final isAValidSession = res.first[HAS_PREMIUM_ACCESS].length < 4 ||
          res.first[HAS_PREMIUM_ACCESS].every((e) => e == true);
      final isAPremiumSession = res.first[COLLABORATOR_UIDS].length > 3;
      final isWhitelisted = res.first[IS_WHITELISTED];
      final presetUID = res.first[PRESET_UID];
      return StaticSessionMetadataModel(
        leaderUID: leaderUID,
        presetUID: presetUID,
        userIndex: userIndex,
        isAPremiumSession: isAPremiumSession,
        leaderIsWhitelisted: isWhitelisted,
        isAValidSession: isAValidSession,
      );
    }
  }
}
