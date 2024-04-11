// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
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
part 'nokhte_session_qr_join_coordinator.g.dart';

class NokhteSessionQrJoinCoordinator = _NokhteSessionQrJoinCoordinatorBase
    with _$NokhteSessionQrJoinCoordinator;

abstract class _NokhteSessionQrJoinCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final NokhteSessionQrJoinWidgetsCoordinator widgets;
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;
  final TapDetector tap;

  final DeepLinksCoordinator deepLinks;
  final CollaborationLogicCoordinator logic;
  final CaptureShareNokhteSessionInvitation captureShareNokhteSessionInvitation;

  _NokhteSessionQrJoinCoordinatorBase({
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

  deepLinkReactor() => reaction((p0) => deepLinks.link, (p0) {
        if (p0.isNotEmpty) {
          widgets.qrCode.setQrCodeData(p0);
        }
      });

  @action
  onEnterCollaboratorPool() => logic.enter(EnterCollaboratorPoolParams(
        collaboratorUID: additionalRoutingData["deepLinkUID"] ??
            additionalRoutingData[CollaborationCodeKeys.collaboratorUID],
        invitationType: InvitationType.nokhteSession,
      ));

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
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
      },
    );
    collaboratorPoolEntryErrorReactor();
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
              await logic.exit();
              await logic.dispose();
              setDisableAllTouchFeedback(true);
            });
          });
        default:
          break;
      }
    }
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });

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