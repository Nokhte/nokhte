import 'package:flutter/material.dart';

mixin SessionConstants {
  static const blue = Color(0xFF00E0FF);
  static const limeTextGrad = [
    Color(0xFFA1FFAA),
    Color(0xFF39FF18),
  ];
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

  static const relativePaywall = '/paywall';
  static const relativeWaitingPatron = '/waiting_patron';

  static const lobby = '/session/core$relativeLobby';
  static const duoGreeter = '/session/core$relativeDuoGreeter';
  static const groupGreeter = '/session/core$relativeGroupGreeter';
  static const trialGreeter = '/session/core$relativeTrialGreeter';
  static const exit = '/session/core$relativeExit';

  static const hybrid = '/session/hybrid$relativeRoot';
  static const hybridSpeakingInstructions =
      '/session/hybrid$relativeSpeakingInstructions';
  static const hybridWaiting = '/session/hybrid$relativeWaiting';
  static const hybridNotesInstructions =
      '/session/hybrid$relativeNotesInstructions';
  static const hybridNotes = '/session/hybrid$relativeNotes';

  static const paywall = '/session/monetize$relativePaywall';
  static const waitingPatron = '/session/monetize$relativeWaitingPatron';

  static const notesWaiting = '/session/notes$relativeWaiting';
  static const notesFullInstructions =
      '/session/notes$relativeFullInstructions';
  static const notesHalfInstructions =
      '/session/notes$relativeHalfInstructions';
  static const notes = '/session/notes$relativeRoot';

  static const speaking = '/session/speaking$relativeRoot';
  static const speakingFullInstructions =
      '/session/speaking$relativeFullInstructions';
  static const speakingHalfInstructions =
      '/session/speaking$relativeHalfInstructions';
  static const speakingWaiting = '/session/speaking$relativeWaiting';
}
