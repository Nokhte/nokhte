import 'package:flutter/material.dart';

mixin SessionConstants {
  static const blue = Color(0xFF00E0FF);
  static const limeTextGrad = [
    Color(0xFFA1FFAA),
    Color(0xFF39FF18),
  ];

  static const module = '/session/';

  static const relativeRoot = '/';
  static const relativeLobby = '/lobby';
  static const relativeDuoGreeter = '/duo_greeter';
  static const relativeGroupGreeter = '/group_greeter';
  static const relativeTrialGreeter = '/trial_greeter';
  static const relativeExit = '/exit';

  static const relativeSpeakingInstructions = '/speaking_instructions';
  static const relativeNotesInstructions = '/notes_instructions';
  static const relativeWaiting = '/waiting';
  static const relativeNotes = '/notes';

  static const relativeInstructions = '/instructions';
  static const relativeFullInstructions = '/full_instructions';
  static const relativeHalfInstructions = '/half_instructions';
  static const relativeSpeaking = '/speaking';

  static const relativePaywall = '/paywall';
  static const relativeWaitingPatron = '/waiting_patron';

  static const lobby = '${module}core$relativeLobby';
  static const duoGreeter = '${module}core$relativeDuoGreeter';
  static const groupGreeter = '${module}core$relativeGroupGreeter';
  static const trialGreeter = '${module}core$relativeTrialGreeter';
  static const exit = '${module}core$relativeExit';

  static const hybridRouter = '${module}hybrid$relativeRoot';
  static const relativeHybrid = '/hybrid';
  static const hybrid = '${module}hybrid$relativeHybrid';
  static const hybridSpeakingInstructions =
      '${module}hybrid$relativeSpeakingInstructions';
  static const hybridWaiting = '${module}hybrid$relativeWaiting';
  static const hybridNotesInstructions =
      '${module}hybrid$relativeNotesInstructions';
  static const hybridNotes = '${module}hybrid$relativeNotes';

  static const paywall = '${module}monetize$relativePaywall';
  static const waitingPatron = '${module}monetize$relativeWaitingPatron';

  static const notesWaiting = '${module}notes$relativeWaiting';
  static const notesFullInstructions =
      '${module}notes$relativeFullInstructions';
  static const notesHalfInstructions =
      '${module}notes$relativeHalfInstructions';
  static const notes = '${module}notes$relativeRoot';

  static const speakingRouter = '${module}speaking$relativeRoot';
  static const speaking = '${module}speaking$relativeSpeaking';
  static const speakingFullInstructions =
      '${module}speaking$relativeFullInstructions';
  static const speakingHalfInstructions =
      '${module}speaking$relativeHalfInstructions';
  static const speakingWaiting = '${module}speaking$relativeWaiting';
}
