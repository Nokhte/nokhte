import 'screens.dart';

mixin PosthogPageNameConstants {
  // Home Screen Constants
  static const String homeScreenRootRouter = '\$home_screen_root_router';
  static const String compassAndQrGuideHomeScreen =
      '\$compass_and_qr_guide_home_screen';
  static const String compassAndStorageGuideHomeScreen =
      '\$compass_and_storage_guide_home_screen';
  static const String qrAndStorageAdeptHomeScreen =
      '\$qr_and_storage_adept_home_screen';
  static const String qrNavigationReminderHomeScreen =
      '\$qr_navigation_reminder_home_screen';
  static const String shortQrGuideHomeScreen = '\$short_qr_guide_home_screen';
  static const String storageGuideHomeScreen = '\$storage_guide_home_screen';

  // Collaboration Constants
  static const String collaborationHome = '\$collaboration_home';
  static const String collaboratorPool = '\$collaborator_pool';

  // Nokhte Session Constants
  static const String nokhteSessionGreeter = '\$nokhte_session_greeter';
  static const String nokhteSessionPhase1Consultation =
      '\$nokhte_session_phase1_consultation';
  static const String nokhteSessionPhase2WaitToExit =
      '\$nokhte_session_phase2_wait_to_exit';
  static const String nokhteSessionNotesInstructions =
      '\$nokhte_session_notes_instructions';
  static const String nokhteSessionNotesScreen =
      '\$nokhte_session_notes_screen';
  static const String nokhteSessionSpeakingInstructions =
      '\$nokhte_session_speaking_instructions';
  static const String nokhteSeessionSpeakingScreen =
      '\$nokhte_seession_speaking_screen';
  static const String nokhteSessionExit = '\$nokhte_session_exit';

  // Other Constants
  static const String loginScreen = '\$login_screen';

  String getScreenName(Screens screen) {
    switch (screen) {
      case Screens.login:
        return loginScreen;
      case Screens.homeRootRouter:
        return homeScreenRootRouter;
      case Screens.compassAndQrGuideHome:
        return compassAndQrGuideHomeScreen;
      case Screens.compassAndStorageGuideHome:
        return compassAndStorageGuideHomeScreen;
      case Screens.qrAndStorageAdeptHome:
        return qrAndStorageAdeptHomeScreen;
      case Screens.qrNavigationReminderHome:
        return qrNavigationReminderHomeScreen;
      case Screens.shortQrGuideHome:
        return shortQrGuideHomeScreen;
      case Screens.storageGuideHome:
        return storageGuideHomeScreen;
      case Screens.collaborationHome:
        return collaborationHome;
      case Screens.collaboratorPool:
        return collaboratorPool;
      case Screens.nokhteSessionGreeter:
        return nokhteSessionGreeter;
      case Screens.nokhteSessionNotesInstructions:
        return nokhteSessionNotesInstructions;
      case Screens.nokhteSessionNotes:
        return nokhteSessionNotesScreen;
      case Screens.nokhteSessionSpeakingInstructions:
        return nokhteSessionSpeakingInstructions;
      case Screens.nokhteSessionSpeaking:
        return nokhteSeessionSpeakingScreen;
      case Screens.nokhteSessionExit:
        return nokhteSessionExit;
    }
  }
}
