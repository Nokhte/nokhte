// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_router_coordinator.dart';

import 'phase0_home_screen_widgets_coordinator.dart';
part 'phase0_home_screen_coordinator.g.dart';

class Phase0HomeScreenCoordinator = _Phase0HomeScreenCoordinatorBase
    with _$Phase0HomeScreenCoordinator;

abstract class _Phase0HomeScreenCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final DeleteUnconsecratedCollaborationsCoordinator
      deleteUnconsecratedCollaborations;
  final Phase0HomeScreenWidgetsCoordinator widgets;
  final CollaborationLogicCoordinator collaborationLogic;

  @observable
  bool isConnected = true;

  @action
  setIsConnected(bool newVal) => isConnected = newVal;

  _Phase0HomeScreenCoordinatorBase({
    required this.deleteUnconsecratedCollaborations,
    required super.getUserInfo,
    required this.collaborationLogic,
    required this.widgets,
  });

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await deleteUnconsecratedCollaborations(NoParams());
    await decideAndRoute(setParams);
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
