import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/delete_unconsecrated_collaborations_module.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';
import 'home_widgets_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        HomeWidgetsModule(),
        GesturesModule(),
        CollaborationLogicModule(),
        DeleteUnconsecratedCollaborationsModule(),
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
      ];
  @override
  binds(i) {
    i.add<Phase0HomeScreenCoordinator>(
      () => Phase0HomeScreenCoordinator(
        deleteUnconsecratedCollaborations:
            Modular.get<DeleteUnconsecratedCollaborationsCoordinator>(),
        getUserInfo: Modular.get<GetUserInfoStore>(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        widgets: Modular.get<Phase0HomeScreenWidgetsCoordinator>(),
      ),
    );
    i.add<Phase1HomeScreenCoordinator>(
      () => Phase1HomeScreenCoordinator(
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<Phase1HomeScreenWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<Phase2HomeScreenCoordinator>(
      () => Phase2HomeScreenCoordinator(
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<Phase2HomeScreenWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
    i.add<Phase3HomeScreenCoordinator>(
      () => Phase3HomeScreenCoordinator(
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<Phase3HomeScreenWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      "/",
      transition: TransitionType.noTransition,
      child: (context) => Phase0HomeScreen(
        coordinator: Modular.get<Phase0HomeScreenCoordinator>(),
      ),
    );
    r.child(
      "/phase1",
      transition: TransitionType.noTransition,
      child: (context) => Phase1HomeScreen(
        coordinator: Modular.get<Phase1HomeScreenCoordinator>(),
      ),
    );
    r.child(
      "/phase2",
      transition: TransitionType.noTransition,
      child: (context) => Phase2HomeScreen(
        coordinator: Modular.get<Phase2HomeScreenCoordinator>(),
      ),
    );
    r.child(
      "/phase3",
      transition: TransitionType.noTransition,
      child: (context) => Phase3HomeScreen(
        coordinator: Modular.get<Phase3HomeScreenCoordinator>(),
      ),
    );
  }
}
