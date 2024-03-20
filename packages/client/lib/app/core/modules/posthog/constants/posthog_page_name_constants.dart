import 'screens.dart';

mixin PosthogPageNameConstants {
  // Home Screen Constants
  static const String homeScreenPhase0RootDecider =
      '\$home_screen_phase0_root_decider';
  static const String homeScreenPhase1NoInvitationFlowNoSession =
      '\$home_screen_phase1_no_invitation_flow_no_session';
  static const String homeScreenPhase2DoneInvitationFlowNoSession =
      '\$home_screen_phase2_done_invitation_flow_no_session';
  static const String homeScreenPhase3HasSession =
      '\$home_screen_phase3_has_session';
  static const String homeScreenPhase4 =
      '\$home_screen_phase4_has_gone_into_storage';
  static const String homeScreenPhase5 =
      '\$home_screen_phase5_has_gone_into_storage_not_invitation_flow';

  // Collaboration Constants
  static const String collaborationHome = '\$collaboration_home';
  static const String collaboratorPool = '\$collaborator_pool';

  // Nokhte Session Constants
  static const String nokhteSessionPhase0Greeter =
      '\$nokhte_session_phase0_greeter';
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
  static const String nokhteSessionPhase3 = '\$nokhte_session_phase3';

  // Other Constants
  static const String loginScreen = '\$login_screen';

  String getScreenName(Screens screen) {
    switch (screen) {
      case Screens.login:
        return loginScreen;
      case Screens.homePhase0:
        return homeScreenPhase0RootDecider;
      case Screens.homePhase1:
        return homeScreenPhase1NoInvitationFlowNoSession;
      case Screens.homePhase2:
        return homeScreenPhase2DoneInvitationFlowNoSession;
      case Screens.homePhase3:
        return homeScreenPhase3HasSession;
      case Screens.homePhase4:
        return homeScreenPhase3HasSession;
      case Screens.homePhase5:
        return homeScreenPhase5;
      case Screens.collaborationHome:
        return collaborationHome;
      case Screens.collaboratorPool:
        return collaboratorPool;
      case Screens.nokhteSessionPhase0:
        return nokhteSessionPhase0Greeter;
      case Screens.nokhteSessionNotesInstructions:
        return nokhteSessionNotesInstructions;
      case Screens.nokhteSessionNotes:
        return nokhteSessionNotesScreen;
      case Screens.nokhteSessionSpeakingInstructions:
        return nokhteSessionSpeakingInstructions;
      case Screens.nokhteSessionSpeaking:
        return nokhteSeessionSpeakingScreen;
      case Screens.nokhteSessionPhase3:
        return nokhteSessionPhase3;
    }
  }
}
