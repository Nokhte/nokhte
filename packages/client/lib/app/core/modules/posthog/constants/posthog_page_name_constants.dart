import 'screens.dart';

mixin PosthogPageNameConstants {
  String homeScreenPhase0RootDecider = '\$home_screen_phase0_root_decider';
  String homeScreenPhase1NoInvitationFlowNoSession =
      '\$home_screen_phase1_no_invitation_flow_no_session';
  String homeScreenPhase2DoneInvitationFlowNoSession =
      '\$home_screen_phase2_done_invitation_flow_no_session';
  String homeScreenPhase3HasSession = '\$home_screen_phase3_has_session';
  String collaborationHome = '\$collaboration_home';
  String collaboratorPool = '\$collaborator_pool';
  String nokhteSessionPhase0Greeter = '\$nokhte_session_phase0_greeter';
  String nokhteSessionPhase1Consultation =
      '\$nokhte_session_phase1_consultation';
  String nokhteSessionPhase2WaitToExit = '\$nokhte_session_phase2_wait_to_exit';
  String loginScreen = '\$login_screen';

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
      case Screens.collaborationHome:
        return collaborationHome;
      case Screens.collaboratorPool:
        return collaboratorPool;
      case Screens.nokhteSessionPhase0:
        return nokhteSessionPhase0Greeter;
      case Screens.nokhteSessionPhase1:
        return nokhteSessionPhase1Consultation;
      case Screens.nokhteSessionPhase2:
        return nokhteSessionPhase2WaitToExit;
    }
  }
}
