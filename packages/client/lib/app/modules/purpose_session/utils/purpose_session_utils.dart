import 'package:nokhte/app/modules/purpose_session/types/types.dart';

class PurposeSessionUtils {
  static bool isPhase1(PurposeSessionScreen screen) =>
      screen == PurposeSessionScreen.phase1Consultation;

  static bool isPhase2(PurposeSessionScreen screen) =>
      screen == PurposeSessionScreen.phase2IndividualSynthesis;

  static bool isPhase3(PurposeSessionScreen screen) =>
      screen == PurposeSessionScreen.phase3BuildOnCollaboratorIdeas;

  static bool isPhase4(PurposeSessionScreen screen) =>
      screen == PurposeSessionScreen.phase4CapsuleArrangement;

  static bool isPhase5(PurposeSessionScreen screen) =>
      screen == PurposeSessionScreen.phase5PurposeConsolidation;

  static bool isPhase6(PurposeSessionScreen screen) =>
      screen == PurposeSessionScreen.phase6PerspectivesScheduling;

  static bool shouldDeleteCollaboration(PurposeSessionScreen screen) =>
      !isPhase6(screen);

  static bool shouldDeleteSoloDocument(PurposeSessionScreen screen) =>
      !isPhase1(screen) && !isPhase6(screen);

  static bool shouldDeleteCapsuleArrangement(PurposeSessionScreen screen) =>
      isPhase4(screen) || isPhase5(screen);

  static bool shouldDeleteCollaborativeDocument(PurposeSessionScreen screen) =>
      isPhase5(screen);
  static bool shouldDeleteSchedulingSession(PurposeSessionScreen screen) =>
      isPhase6(screen);
}
