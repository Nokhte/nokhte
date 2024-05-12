// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'session_starter_coordinator.g.dart';

class SessionStarterCoordinator = _SessionStarterCoordinatorBase
    with _$SessionStarterCoordinator;

abstract class _SessionStarterCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final SessionStarterWidgetsCoordinator widgets;
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;
  final TapDetector tap;

  final DeepLinksCoordinator deepLinks;
  final SessionStartersLogicCoordinator logic;
  final CaptureShareNokhteSessionInvitation captureShareNokhteSessionInvitation;

  _SessionStarterCoordinatorBase({
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
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await deepLinks.getDeepLink(DeepLinkTypes.nokhteSessionLeader);
    await userInformation.getUserInfoStore(NoParams());
    await logic.initialize();
    await captureScreen(Screens.collaborationHome);
    logic.listenToSessionActivation();
  }

  @action
  onFlowCompleted() => userInformation.updateHasGoneThroughInvitationFlow(true);

  deepLinkReactor() => reaction((p0) => deepLinks.link, (p0) {
        if (p0.isNotEmpty) {
          widgets.qrCode.setQrCodeData(p0);
        }
      });

  swipeCoordinatesReactor() =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onSwipeCoordinatesChanged(p0);
        });
      });

  initReactors() {
    deepLinkReactor();
    swipeCoordinatesReactor();
    swipeReactor();
    widgets.secondaryBeachWavesMovieStatusReactor(onAnimationComplete);
    widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        widgets.setIsDisconnected(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.setIsDisconnected(true);
      },
    );
    nokhteSearchStatusReactor();
    tapReactor();
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          ifTouchIsNotDisabled(() async {
            widgets.onSwipeDown(() async {
              toggleIsNavigatingAway();
              await logic.dispose();
            });
          });
        default:
          break;
      }
    }
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });

  nokhteSearchStatusReactor() =>
      reaction((p0) => logic.hasFoundNokhteSession, (p0) async {
        if (p0) {
          setDisableAllTouchFeedback(true);
          await logic.dispose();
          widgets.initTransition();
        }
      });
}
