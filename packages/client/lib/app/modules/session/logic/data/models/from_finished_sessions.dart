import 'package:nokhte/app/modules/session/session.dart';

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
