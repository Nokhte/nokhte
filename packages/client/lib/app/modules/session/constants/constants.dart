import 'package:flutter/material.dart';

mixin SessionConstants {
  static const blue = Color(0xFF00E0FF);
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
  static const relativeSocraticFullInstructions = '/socratic_full_instructions';
  static const socraticFullInstructions =
      '$module$instructionsModule$relativeSocraticFullInstructions';
  static const relativeSocraticJustSymbols = '/socratic_just_symbols';
  static const socraticJustSymbols =
      '$module$instructionsModule$relativeSocraticJustSymbols';
  //

  // core
  static const coreModule = '/core';

  static const relativeLobby = '/lobby';
  static const relativePreview = '/preview';
  static const relativeDuoGreeter = '/duo_greeter';
  static const relativeGroupGreeter = '/group_greeter';
  static const relativeTrialGreeter = '/trial_greeter';
  static const relativeExit = '/exit';

  // static const relativeWaiting = '/waiting';
  static const relativeNotes = '/notes';

  static const relativePaywall = '/paywall';
  static const relativeWaitingPatron = '/waiting_patron';

  static const lobby = '$module$coreModule$relativeLobby';
  static const preview = '$module$coreModule$relativePreview';
  static const duoGreeter = '$module$coreModule$relativeDuoGreeter';
  static const groupGreeter = '$module$coreModule$relativeGroupGreeter';
  static const trialGreeter = '$module$coreModule$relativeTrialGreeter';
  static const exit = '$module$coreModule$relativeExit';

  static const hybridModule = '/hybrid';

  static const hybridRouter = '$module$hybridModule$relativeRoot';
  static const relativeHybrid = '/hybrid';
  static const hybrid = '$module$hybridModule$relativeHybrid';
  static const hybridSpeakingInstructions =
      '$module$hybridModule$relativeSpeakingInstructions';
  // static const hybridWaiting = '$module$hybridModule$relativeWaiting';
  static const hybridNotesInstructions =
      '$module$hybridModule$relativeNotesInstructions';
  static const hybridNotes = '$module$hybridModule$relativeNotes';

  static const monetizeModule = '/monetize';
  static const paywall = '$module$monetizeModule$relativePaywall';
  static const waitingPatron = '$module$monetizeModule$relativeWaitingPatron';

  static const notesModule = '/notes';

  static const notes = '${module}notes$relativeRoot';

  static const speaking = '${module}speaking$relativeRoot';
}
