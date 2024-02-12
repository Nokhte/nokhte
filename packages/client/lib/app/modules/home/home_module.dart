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
    i.add<HomeScreenCoordinator>(
      () => HomeScreenCoordinator(
        deleteUnconsecratedCollaborations:
            Modular.get<DeleteUnconsecratedCollaborationsCoordinator>(),
        userInformation: Modular.get<UserInformationCoordinator>(),
        collaborationLogic: Modular.get<CollaborationLogicCoordinator>(),
        swipe: Modular.get<SwipeDetector>(),
        widgets: Modular.get<HomeScreenWidgetsCoordinator>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
      ),
    );
  }

  @override
  routes(r) {
    r.child(
      "/",
      transition: TransitionType.noTransition,
      child: (context) => HomeScreen(
        coordinator: Modular.get<HomeScreenCoordinator>(),
      ),
    );
  }
}
