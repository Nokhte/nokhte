// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'session_starter_coordinator.g.dart';

class SessionStarterCoordinator = _SessionStarterCoordinatorBase
    with _$SessionStarterCoordinator;

abstract class _SessionStarterCoordinatorBase with Store {
  final SessionStarterWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  final DeepLinksCoordinator deepLinks;
  final SessionStartersLogicCoordinator logic;
  final UserInformationCoordinator userInfo;
  final BaseCoordinator base;

  _SessionStarterCoordinatorBase({
    required this.widgets,
    required this.userInfo,
    required this.deepLinks,
    required this.tap,
    required this.swipe,
    required this.logic,
    required CaptureScreen captureScreen,
  }) : base = BaseCoordinator(captureScreen: captureScreen);

  @observable
  bool isNavigatingAway = false;

  @action
  toggleIsNavigatingAway() => isNavigatingAway = !isNavigatingAway;

  @action
  constructor(Offset center) async {
    widgets.constructor(center);
    widgets.initReactors();
    initReactors();
    await userInfo.getPreferredPreset();
    await deepLinks.getDeepLink(DeepLinkTypes.nokhteSessionLeader);
    await logic.initialize();
    await base.captureScreen(SessionStarterConstants.sessionStarter);
    logic.listenToSessionActivation();
  }

  deepLinkReactor() => reaction((p0) => deepLinks.link, (p0) {
        if (p0.isNotEmpty) {
          widgets.onQrCodeReceived(p0);
        }
      });

  preferredPresetReactor() => reaction((p0) => userInfo.preferredPreset, (p0) {
        if (p0.name.isNotEmpty) {
          widgets.onPreferredPresetReceived(
            sessionName: p0.name,
            tags: p0.tags,
          );
        }
      });

  swipeCoordinatesReactor() =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        base.ifTouchIsNotDisabled(() {
          widgets.onSwipeCoordinatesChanged(p0);
        });
      });

  initReactors() {
    base.disposers.add(preferredPresetReactor());
    base.disposers.add(deepLinkReactor());
    base.disposers.add(swipeCoordinatesReactor());
    base.disposers.add(swipeReactor());
    base.disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => base.setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        base.setDisableAllTouchFeedback(false);
        widgets.base.setIsDisconnected(false);
      },
      onDisconnected: () {
        base.setDisableAllTouchFeedback(true);
        widgets.base.setIsDisconnected(true);
      },
    ));
    base.disposers.add(nokhteSearchStatusReactor());
    base.disposers.add(tapReactor());
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          base.ifTouchIsNotDisabled(() {
            widgets.onSwipeDown(() async {
              toggleIsNavigatingAway();
              await logic.dispose(shouldNuke: true);
            });
          });
        case GestureDirections.left:
          base.ifTouchIsNotDisabled(() {
            widgets.onSwipeLeft(() async {
              toggleIsNavigatingAway();
              await logic.dispose(shouldNuke: true);
            });
          });
        default:
          break;
      }
    }
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        base.ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });

  nokhteSearchStatusReactor() =>
      reaction((p0) => logic.hasFoundNokhteSession, (p0) async {
        if (p0) {
          base.setDisableAllTouchFeedback(true);
          await logic.dispose();
          widgets.initTransition();
        }
      });

  deconstructor() {
    logic.dispose();
    base.deconstructor();
  }
}
