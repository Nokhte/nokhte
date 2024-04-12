// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/screens.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/presentation.dart';
part 'home_screen_root_router_coordinator.g.dart';

class HomeScreenRootRouterCoordinator = _HomeScreenRootRouterCoordinatorBase
    with _$HomeScreenRootRouterCoordinator;

abstract class _HomeScreenRootRouterCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final CleanUpCollaborationArtifactsCoordinator cleanUpCollaborationArtifacts;
  final HomeScreenRootRouterWidgetsCoordinator widgets;
  final CollaborationLogicCoordinator collaborationLogic;
  final IdentifyUser identifyUser;

  @observable
  bool isConnected = true;

  @action
  setIsConnected(bool newVal) => isConnected = newVal;

  _HomeScreenRootRouterCoordinatorBase({
    required this.cleanUpCollaborationArtifacts,
    required super.getUserInfo,
    required this.collaborationLogic,
    required this.widgets,
    required this.identifyUser,
    required super.captureScreen,
  });

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    Modular.to.navigate("/irl_nokhte_session/");
    // await identifyUser(NoParams());
    // await captureScreen(Screens.homeRootRouter);
    // await cleanUpCollaborationArtifacts(NoParams());
    // if (isConnected) {
    //   await decideAndRoute(setParams);
    // }
  }

  @action
  setParams() {
    params = ResumeOnShoreParams(
      direction: widgets.waterDirection,
      position: widgets.beachWaves.currentAnimationValues.first,
    );
  }

  initReactors() {
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () async {
        widgets.onConnected();
        setIsConnected(true);
      },
      onLongReConnected: () async {
        await decideAndRoute(setParams);
        widgets.onConnected();
        setIsConnected(true);
      },
      onDisconnected: () {
        widgets.onDisconnected();
        setIsConnected(false);
      },
    );
  }
}
