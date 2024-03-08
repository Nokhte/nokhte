// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/screens.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_router_coordinator.dart';
import 'home_screen_phase0_widgets_coordinator.dart';
part 'home_screen_phase0_coordinator.g.dart';

class HomeScreenPhase0Coordinator = _HomeScreenPhase0CoordinatorBase
    with _$HomeScreenPhase0Coordinator;

abstract class _HomeScreenPhase0CoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final DeleteUnconsecratedCollaborationsCoordinator
      deleteUnconsecratedCollaborations;
  final HomeScreenPhase0WidgetsCoordinator widgets;
  final CollaborationLogicCoordinator collaborationLogic;
  final IdentifyUser identifyUser;

  @observable
  bool isConnected = true;

  @action
  setIsConnected(bool newVal) => isConnected = newVal;

  _HomeScreenPhase0CoordinatorBase({
    required this.deleteUnconsecratedCollaborations,
    required super.getUserInfo,
    required this.collaborationLogic,
    required this.widgets,
    required this.identifyUser,
    required super.captureScreen,
  });

  @action
  constructor() async {
    Modular.to.navigate('/irl_nokhte_session/');
    widgets.constructor();
    initReactors();
    await identifyUser(NoParams());
    await captureScreen(Screens.homePhase0);
    // await deleteUnconsecratedCollaborations(NoParams());
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
