import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

mixin FromFinishedSessions {
  SessionInstructionTypes toInstructionType({
    required List otherSessions,
    required List currentPresetSessions,
  }) {
    final bool hasDoneCurrentPresetBefore = currentPresetSessions.isNotEmpty;
    final bool hasDoneAnotherSessionBefore = otherSessions.isNotEmpty;

    if (hasDoneAnotherSessionBefore) {
      return hasDoneCurrentPresetBefore
          ? SessionInstructionTypes.skipInstructions
          : SessionInstructionTypes.justSymbols;
    } else {
      return hasDoneCurrentPresetBefore
          ? SessionInstructionTypes.skipInstructions
          : SessionInstructionTypes.fullInstructions;
    }
  }
}
