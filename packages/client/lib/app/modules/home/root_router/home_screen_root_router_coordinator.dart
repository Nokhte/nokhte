// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/modules/user_metadata/user_metadata.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'home_screen_root_router_coordinator.g.dart';

class HomeScreenRootRouterCoordinator = _HomeScreenRootRouterCoordinatorBase
    with _$HomeScreenRootRouterCoordinator;

abstract class _HomeScreenRootRouterCoordinatorBase
    with Store, HomeScreenRouter {
  final CleanUpCollaborationArtifactsCoordinator cleanUpCollaborationArtifacts;
  final HomeScreenRootRouterWidgetsCoordinator widgets;
  final SessionStartersLogicCoordinator sessionStarters;
  final UserMetadataCoordinator userMetadata;
  @override
  final GetUserInfoStore getUserInfo;

  @observable
  bool isConnected = true;

  @action
  setIsConnected(bool newVal) => isConnected = newVal;

  _HomeScreenRootRouterCoordinatorBase({
    required this.cleanUpCollaborationArtifacts,
    required this.userMetadata,
    required this.getUserInfo,
    required this.sessionStarters,
    required this.widgets,
  });

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await cleanUpCollaborationArtifacts(NoParams());
    await userMetadata.addMetadata(NoParams());
    if (isConnected) {
      await decideAndRoute(setParams);
    }
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
