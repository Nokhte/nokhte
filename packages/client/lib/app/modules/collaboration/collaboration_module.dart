import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/modules.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'collaboration_widgets_module.dart';

class CollaborationModule extends Module {
  @override
  List<Module> get imports => [
        CollaborationWidgetsModule(),
        UserInformationModule(),
        GesturesModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        CollaborationLogicModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<CollaborationHomeScreenCoordinator>(
      () => CollaborationHomeScreenCoordinator(
        logic: Modular.get<CollaborationLogicCoordinator>(),
        swipe: Modular.get<SwipeDetector>(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        widgets: Modular.get<CollaborationHomeScreenWidgetsCoordinator>(),
        userInformation: i<UserInformationCoordinator>(),
      ),
    );
    i.add<CollaboratorPoolScreenCoordinator>(
      () => CollaboratorPoolScreenCoordinator(
        logic: Modular.get<CollaborationLogicCoordinator>(),
        widgets: Modular.get<CollaboratorPoolScreenWidgetsCoordinator>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      transition: TransitionType.noTransition,
      child: (context) => CollaborationHomeScreen(
        coordinator: Modular.get<CollaborationHomeScreenCoordinator>(),
      ),
    );
    r.child(
      '/pool',
      transition: TransitionType.noTransition,
      child: (context) => CollaboratorPoolScreen(
        coordinator: Modular.get<CollaboratorPoolScreenCoordinator>(),
      ),
    );
  }
}
