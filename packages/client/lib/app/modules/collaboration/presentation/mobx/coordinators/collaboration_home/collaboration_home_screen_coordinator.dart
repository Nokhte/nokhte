// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
part 'collaboration_home_screen_coordinator.g.dart';

class CollaborationHomeScreenCoordinator = _CollaborationHomeScreenCoordinatorBase
    with _$CollaborationHomeScreenCoordinator;

abstract class _CollaborationHomeScreenCoordinatorBase extends BaseCoordinator
    with Store {
  final CollaborationHomeScreenWidgetsCoordinator widgets;
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;
  final DeepLinksCoordinator deepLinks;
  final EnterCollaboratorPoolStore enterCollaboratorPool;

  _CollaborationHomeScreenCoordinatorBase({
    required this.widgets,
    required this.deepLinks,
    required this.userInformation,
    required this.swipe,
    required this.enterCollaboratorPool,
  });

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
  constructor() async {
    deepLinks.listenForOpenedDeepLink(NoParams());
    setAdditionalRoutingData(Modular.args.data);
    widgets.constructor();
    widgets.initReactors(
      onGradientTreeNodeTap,
      onFlowCompleted,
      onEnterCollaboratorPool,
    );
    initReactors();
    await userInformation.getUserInfo(NoParams());
    if (userInformation.getUserInfo.hasGoneThroughInvitationFlow) {
      if (additionalRoutingData.isEmpty) {
        widgets.postInvitationFlowConstructor();
      } else {
        if (additionalRoutingData[CollaborationCodeKeys.hasSentAnInvitation] ==
            true) {
          widgets.enterCollaboratorPoolConstructor();
        } else {
          widgets.postInvitationFlowNoInviteConstructor();
        }
      }
    } else {
      widgets.invitationFlowConstructor();
    }
    await deepLinks.getDeepLinkURL(
      const GetDeepLinkURLParams(
        type: DeepLinkTypes.collaboratorInvitation,
      ),
    );
  }

  @action
  onGradientTreeNodeTap() => ifTouchIsNotDisabled(() {
        deepLinks.sendDeepLink(deepLinks.getDeepLinkURL.link);
      });

  @action
  onFlowCompleted() => userInformation.updateHasGoneThroughInvitationFlow(true);

  @action
  onEnterCollaboratorPool() => enterCollaboratorPool(
      additionalRoutingData[CollaborationCodeKeys.collaboratorUID]);

  initReactors() {
    swipeReactor();
    shareInvitationReactor();
    deepLinksReactor();
    collaboratorPoolEntryReactor();
  }

  deepLinksReactor() => reaction((p0) => deepLinks.listenForOpenedDeepLink.path,
      (p0) => onDeepLinkOpened(p0));

  @action
  onDeepLinkOpened(String path) {
    if (path == '/collaboration/') {
      setAdditionalRoutingData(
        deepLinks.listenForOpenedDeepLink.additionalMetadata,
      );
      widgets.initCollaboratorPoolWidgets();
    }
  }

  shareInvitationReactor() => reaction((p0) => deepLinks.sendDeepLink.isShared,
      (p0) async => await onInvitationShared(p0));

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
          toggleIsNavigatingAway();
          ifTouchIsNotDisabled(() {
            widgets.onSwipeDown();
          });
          toggleDisableAllTouchFeedback();
        default:
          break;
      }
    }
  }

  collaboratorPoolEntryReactor() => reaction(
      (p0) => enterCollaboratorPool.hasEntered,
      (p0) => onCollaboratorPoolEntered(p0));

  onCollaboratorPoolEntered(bool hasEntered) {
    if (hasEntered) {
      Timer.periodic(Seconds.get(0, milli: 100), (timer) {
        if (widgets.gradientTreeNode.movieStatus == MovieStatus.finished) {
          Modular.to.navigate('/collaboration/pool');
          timer.cancel();
        }
      });
    }
  }

  @override
  List<Object> get props => [];
}
