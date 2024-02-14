// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_router_coordinator.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
part 'collaboration_home_screen_coordinator.g.dart';

class CollaborationHomeScreenCoordinator = _CollaborationHomeScreenCoordinatorBase
    with _$CollaborationHomeScreenCoordinator;

abstract class _CollaborationHomeScreenCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final CollaborationHomeScreenWidgetsCoordinator widgets;
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;
  final DeepLinksCoordinator deepLinks;
  final CollaborationLogicCoordinator logic;

  _CollaborationHomeScreenCoordinatorBase({
    required this.widgets,
    required this.deepLinks,
    required this.userInformation,
    required this.swipe,
    required this.logic,
  }) : super(getUserInfo: userInformation.getUserInfoStore);

  @observable
  ObservableMap additionalRoutingData = ObservableMap.of({});

  @action
  setAdditionalRoutingData(Map? newMap) =>
      additionalRoutingData = ObservableMap.of(newMap ?? {});

  @observable
  bool isNavigatingAway = false;

  @action
  toggleIsNavigatingAway() => isNavigatingAway = !isNavigatingAway;

  @action
  onResumed() {
    ifTouchIsNotDisabled(() {
      widgets.onResumed();
    });
  }

  @action
  onInactive() {
    ifTouchIsNotDisabled(() {
      widgets.onInactive();
    });
  }

  @action
  constructor() async {
    deepLinks.listenForOpenedDeepLinkStore(NoParams());
    setAdditionalRoutingData(Modular.args.data);
    widgets.constructor();
    widgets.initReactors(
      onFlowCompleted,
      onEnterCollaboratorPool,
    );
    initReactors();
    await userInformation.getUserInfoStore(NoParams());
    if (userInformation.getUserInfoStore.hasGoneThroughInvitationFlow) {
      if (additionalRoutingData.isEmpty) {
        widgets.postInvitationFlowConstructor();
      } else {
        if (additionalRoutingData[CollaborationCodeKeys.hasSentAnInvitation] ==
            true) {
          widgets.enterCollaboratorPoolConstructor();
          setDisableAllTouchFeedback(true);
        }
      }
    } else {
      widgets.invitationFlowConstructor();
    }
    await deepLinks.getDeepLink(DeepLinkTypes.nokhteSession);
  }

  @action
  onGradientTreeNodeTap() => ifTouchIsNotDisabled(() {
        deepLinks.share(deepLinks.link);
      });

  @action
  onFlowCompleted() => userInformation.updateHasGoneThroughInvitationFlow(true);

  @action
  onEnterCollaboratorPool() => logic.enter(EnterCollaboratorPoolParams(
        collaboratorUID: additionalRoutingData["deepLinkUID"] ??
            additionalRoutingData[CollaborationCodeKeys.collaboratorUID],
        invitationType: InvitationType.nokhteSession,
      ));

  initReactors() {
    swipeReactor();
    shareInvitationReactor();
    deepLinksReactor();
    collaboratorPoolEntryReactor();
    gradientTreeNodeTapReactor(onGradientTreeNodeTap);
    widgets.beachWavesMovieStatusReactor(onAnimationComplete);
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        widgets.onResumed();
      },
      onDisconnected: () {
        widgets.onInactive();
        setDisableAllTouchFeedback(true);
      },
    );
  }

  deepLinksReactor() => reaction(
      (p0) => deepLinks.listenForOpenedDeepLinkStore.path,
      (p0) => onDeepLinkOpened(p0));

  @action
  onDeepLinkOpened(String path) async {
    if (path == '/collaboration/') {
      setAdditionalRoutingData(
        deepLinks.listenForOpenedDeepLinkStore.additionalMetadata,
      );
      if (deepLinks.listenForOpenedDeepLinkStore
              .additionalMetadata["isTheUsersInvitation"] !=
          null) {
        widgets.onNokhteSessionLinkOpened();
        await onEnterCollaboratorPool();
      } else {
        // widgets.initCollaboratorPoolWidgets();
      }
    }
  }

  shareInvitationReactor() => reaction(
      (p0) => deepLinks.isShared, (p0) async => await onInvitationShared(p0));

  @action
  onInvitationShared(bool isShared) async {
    if (isShared) {
      if (additionalRoutingData.isNotEmpty) {
        widgets.initCollaboratorPoolWidgets();
        await onEnterCollaboratorPool();
      } else {
        widgets.toggleInvitationIsSent();
      }
      userInformation.updateHasSentAnInvitation(true);
    }
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          ifTouchIsNotDisabled(() {
            toggleIsNavigatingAway();
            widgets.onSwipeDown();
            setDisableAllTouchFeedback(true);
          });
        default:
          break;
      }
    }
  }

  collaboratorPoolEntryReactor() =>
      reaction((p0) => logic.hasEntered, (p0) => onCollaboratorPoolEntered(p0));

  onCollaboratorPoolEntered(bool hasEntered) {
    if (hasEntered) {
      Timer.periodic(Seconds.get(0, milli: 100), (timer) {
        if (widgets.beachWaves.movieStatus == MovieStatus.finished &&
            widgets.beachWaves.movieMode ==
                BeachWaveMovieModes.oceanDiveToTimesUp) {
          Modular.to.navigate('/collaboration/pool');
          timer.cancel();
        }
      });
    }
  }

  gradientTreeNodeTapReactor(Function onGradientTreeNodeTap) =>
      reaction((p0) => widgets.gradientTreeNode.tapCount, (p0) {
        ifTouchIsNotDisabled(() async {
          await onGradientTreeNodeTap();
        });
      });

  @override
  List<Object> get props => [];
}
