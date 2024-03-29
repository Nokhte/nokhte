// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';
import 'package:nokhte/app/core/modules/deep_links/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';
part 'collaboration_home_screen_coordinator.g.dart';

class CollaborationHomeScreenCoordinator = _CollaborationHomeScreenCoordinatorBase
    with _$CollaborationHomeScreenCoordinator;

abstract class _CollaborationHomeScreenCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final CollaborationHomeScreenWidgetsCoordinator widgets;
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;
  final TapDetector tap;

  final DeepLinksCoordinator deepLinks;
  final CollaborationLogicCoordinator logic;
  final CaptureShareNokhteSessionInvitation captureShareNokhteSessionInvitation;

  _CollaborationHomeScreenCoordinatorBase({
    required this.widgets,
    required this.deepLinks,
    required this.userInformation,
    required this.tap,
    required this.swipe,
    required this.logic,
    required this.captureShareNokhteSessionInvitation,
    required super.captureScreen,
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
          setDisableAllTouchFeedback(true);
        }
      }
    } else {
      widgets.invitationFlowConstructor();
    }
    await deepLinks.getDeepLink(DeepLinkTypes.nokhteSession);
    await captureScreen(Screens.collaborationHome);
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
    collaboratorPoolEntryErrorReactor();
    tapReactor();
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
        if (!isInErrorMode) {
          widgets.onNokhteSessionLinkOpened();
          await onEnterCollaboratorPool();
          deepLinks.reset();
        } else {
          await onEnterCollaboratorPool();
          widgets.transitionToPoolFromError();
        }
      }
    }
  }

  shareInvitationReactor() => reaction(
      (p0) => deepLinks.isShared, (p0) async => await onInvitationShared(p0));

  @action
  onInvitationShared(bool isShared) async {
    if (isShared) {
      await captureShareNokhteSessionInvitation(NoParams());
      await getUserInfo(NoParams());
      if (additionalRoutingData.isNotEmpty) {
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

  collaboratorPoolEntryErrorReactor() =>
      reaction((p0) => logic.errorMessage, (p0) {
        if (p0.isNotEmpty) {
          setDisableAllTouchFeedback(true);
          setIsInErrorMode(true);
          widgets.onError(p0);
          deepLinks.reset();
          logic.resetErrorMessage();
        }
      });

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        print("tap $p0");
        if (isInErrorMode) {
          setIsInErrorMode(false);
          widgets.onErrorResolved();
        }
      });

  gradientTreeNodeTapReactor(Function onGradientTreeNodeTap) =>
      reaction((p0) => widgets.gradientTreeNode.tapCount, (p0) {
        ifTouchIsNotDisabled(() async {
          await onGradientTreeNodeTap();
        });
      });

  @override
  List<Object> get props => [];
}
