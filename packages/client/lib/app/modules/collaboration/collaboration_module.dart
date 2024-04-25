import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links_module.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/legacy_connectivity/legacy_connectivity_module.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/posthog/posthog_module.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/user_information_module.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/collaboration_logic_module.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'collaboration_widgets_module.dart';

class CollaborationModule extends Module {
  @override
  List<Module> get imports => [
        CollaborationWidgetsModule(),
        UserInformationModule(),
        DeepLinksModule(),
        LegacyConnectivityModule(),
        CollaborationLogicModule(),
        PosthogModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<NokhteSessionQrJoinCoordinator>(
      () => NokhteSessionQrJoinCoordinator(
        tap: TapDetector(),
        captureScreen: Modular.get<CaptureScreen>(),
        captureShareNokhteSessionInvitation:
            Modular.get<CaptureShareNokhteSessionInvitation>(),
        logic: Modular.get<CollaborationLogicCoordinator>(),
        swipe: SwipeDetector(),
        deepLinks: Modular.get<DeepLinksCoordinator>(),
        widgets: Modular.get<NokhteSessionQrJoinWidgetsCoordinator>(),
        userInformation: i<UserInformationCoordinator>(),
      ),
    );
    i.add<CollaboratorPoolScreenCoordinator>(
      () => CollaboratorPoolScreenCoordinator(
        captureScreen: Modular.get<CaptureScreen>(),
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
      child: (context) => NokhteSessionQrJoinScreen(
        coordinator: Modular.get<NokhteSessionQrJoinCoordinator>(),
      ),
    );
  }
}
