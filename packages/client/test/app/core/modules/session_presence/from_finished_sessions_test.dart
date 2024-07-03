import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

class Test with FromFinishedSessions {}

void main() {
  final t = Test();
  group("toInstructionType", () {
    test("hasDoneAnotherSessionBefore && !hasDoneCurrentPresetBefore", () {
      final res = t.toInstructionType(
        otherSessions: ['session'],
        currentPresetSessions: [],
      );
      expect(res, SessionInstructionTypes.justSymbols);
    });
    test("hasDoneAnotherSessionBefore && hasDoneCurrentPresetBefore", () {
      final res = t.toInstructionType(
        otherSessions: ['session'],
        currentPresetSessions: ['session'],
      );
      expect(res, SessionInstructionTypes.skipInstructions);
    });

    test(" !hasDoneCurrentPresetBefore && !hasDoneAnotherSessionBefore ", () {
      final res = t.toInstructionType(
        otherSessions: [],
        currentPresetSessions: [],
      );
      expect(res, SessionInstructionTypes.fullInstructions);
    });
  });
}
