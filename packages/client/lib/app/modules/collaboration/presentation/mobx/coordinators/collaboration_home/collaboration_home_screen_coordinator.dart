// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
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
  constructor() async {
    widgets.constructor();
    widgets.initReactors();
    initReactors();
    await deepLinks.getDeepLink(DeepLinkTypes.nokhteSession);
    await userInformation.getUserInfoStore(NoParams());
    await logic.enter(
      EnterCollaboratorPoolParams(
        collaboratorUID: userInformation.getUserInfoStore.userUID,
        invitationType: InvitationType.nokhteSession,
      ),
    );
    await captureScreen(Screens.collaborationHome);
    logic.listenToNokhteSearch();
  }

  @action
  onFlowCompleted() => userInformation.updateHasGoneThroughInvitationFlow(true);

  @action
  onEnterCollaboratorPool() => logic.enter(EnterCollaboratorPoolParams(
        collaboratorUID: additionalRoutingData["deepLinkUID"] ??
            additionalRoutingData[CollaborationCodeKeys.collaboratorUID],
        invitationType: InvitationType.nokhteSession,
      ));

  swipeCoordinatesReactor() =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        widgets.onSwipeCoordinatesChanged(p0);
      });

  initReactors() {
    swipeCoordinatesReactor();
    swipeReactor();
    widgets.secondaryBeachWavesMovieStatusReactor(onAnimationComplete);
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
    deepLinkAvailabilityReactor();
    nokhteSearchStatusReactor();
  }

  @observable
  String link = '';

  deepLinkAvailabilityReactor() => reaction((p0) => deepLinks.link, (p0) async {
        link = p0;
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          ifTouchIsNotDisabled(() async {
            toggleIsNavigatingAway();
            widgets.onSwipeDown();
            setDisableAllTouchFeedback(true);
            await logic.exit();
            await logic.dispose();
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
          deepLinks.reset();
          logic.resetErrorMessage();
        }
      });

  nokhteSearchStatusReactor() =>
      reaction((p0) => logic.hasFoundNokhteSession, (p0) async {
        if (p0) {
          await logic.dispose();
          widgets.initTransition();
        }
      });
}
