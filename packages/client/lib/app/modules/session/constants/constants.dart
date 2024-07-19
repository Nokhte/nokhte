import 'package:flutter/material.dart';

mixin SessionConstants {
  static const blue = Color(0xFF00E0FF);
  static const white = Colors.white;
  static const limeTextGrad = [
    Color(0xFFA1FFAA),
    Color(0xFF39FF18),
  ];

  static const module = '/session';
  static const relativeRoot = '/';

  // instructions
  static const instructionsModule = '/instructions';
  static const relativeConsultationSpeakingSymbols =
      '/consultation_speaking_symbols';
  static const relativeSpeakingInstructions = '/speaking_instructions';
  static const relativeShowGroupGeometry = '/show_group_geometry';
  static const relativeConsultationNotesSymbols = '/consultation_notes_symbols';
  static const consultationSpeakingSymbols =
      '$module$instructionsModule$relativeConsultationSpeakingSymbols';
  static const consultationNotesSymbols =
      '$module$instructionsModule$relativeConsultationNotesSymbols';
  static const speakingInstructions =
      '$module$instructionsModule$relativeSpeakingInstructions';
  static const showGroupGeometry =
      '$module$instructionsModule$relativeShowGroupGeometry';
  static const relativeNotesInstructions = '/notes_instructions';
  static const notesInstructions =
      '$module$instructionsModule$relativeNotesInstructions';
  static const relativeConsultationJustSymbols = '/consultation_just_symbols';
  static const consultationJustSymbols =
      '$module$instructionsModule$relativeConsultationJustSymbols';
  static const relativeCollaborationFullInstructions =
      '/collaboration_full_instructions';
  static const collaborationFullInstructions =
      '$module$instructionsModule$relativeCollaborationFullInstructions';
  static const relativeSoloHybridInstructions = '/solo_hybrid_instructions';
  static const soloHybridInstructions =
      '$module$instructionsModule$relativeSoloHybridInstructions';
  static const relativeCollaborationJustSymbols = '/collaboration_just_symbols';
  static const collaborationJustSymbols =
      '$module$instructionsModule$relativeCollaborationJustSymbols';
  static const relativeSocraticNotesInstructions =
      '/socratic_notes_instructions';
  static const socraticNotesInstructions =
      '$module$instructionsModule$relativeSocraticNotesInstructions';

  static const relativeSocraticSpeakingSymbols = '/socratic_speaking_symbols';
  static const socraticSpeakingSymbols =
      '$module$instructionsModule$relativeSocraticSpeakingSymbols';
  static const relativeSocraticNotesSymbols = '/socratic_notes_symbols';
  static const socraticNotesSymbols =
      '$module$instructionsModule$relativeSocraticNotesSymbols';
  static const relativeSocraticJustSymbols = '/socratic_just_symbols';
  static const socraticJustSymbols =
      '$module$instructionsModule$relativeSocraticJustSymbols';

  static const coreModule = '/core';

  static const relativeSocraticSpeakingExit = '/socratic_speaking_exit';
  static const relativeLobby = '/lobby';
  static const relativePreview = '/preview';
  static const relativeDuoGreeter = '/duo_greeter';
  static const relativeGroupGreeter = '/group_greeter';
  static const relativeCollaborationGreeter = '/collaboration_greeter';
  static const relativeTrialGreeter = '/trial_greeter';
  static const relativeExit = '/exit';

  static const relativeNotes = '/notes';

  static const relativeInstructions = '/instructions';
  static const relativeFullInstructions = '/full_instructions';
  static const relativeHalfInstructions = '/half_instructions';

  static const relativePaywall = '/paywall';
  static const relativeWaitingPatron = '/waiting_patron';

  static const socraticSpeakingExit =
      '$module$coreModule$relativeSocraticSpeakingExit';
  static const lobby = '$module$coreModule$relativeLobby';
  static const preview = '$module$coreModule$relativePreview';
  static const collaborationGreeter =
      '$module$coreModule$relativeCollaborationGreeter';
  static const duoGreeter = '$module$coreModule$relativeDuoGreeter';
  static const groupGreeter = '$module$coreModule$relativeGroupGreeter';
  static const trialGreeter = '$module$coreModule$relativeTrialGreeter';
  static const exit = '$module$coreModule$relativeExit';

  static const hybridModule = '/hybrid';

  static const relativeGroupHybrid = '/group_hybrid';
  static const relativeSoloHybrid = '/solo_hybrid';
  static const groupHybrid = '$module$hybridModule$relativeGroupHybrid';
  static const soloHybrid = '$module$hybridModule$relativeSoloHybrid';

  static const monetizeModule = '/monetize';

  static const paywall = '$module$monetizeModule$relativePaywall';
  static const waitingPatron = '$module$monetizeModule$relativeWaitingPatron';

  static const notesModule = '/notes';
  static const notes = '$module$notesModule$relativeRoot';

  static const speakingModule = '/speaking';
  static const speaking = '$module$speakingModule$relativeRoot';
}
