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

abstract class _SessionStarterCoordinatorBase
    with Store, BaseCoordinator, Reactions {
  final SessionStarterWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  final DeepLinksCoordinator deepLinks;
  final SessionStartersLogicCoordinator logic;
  final UserInformationCoordinator userInfo;
  @override
  final CaptureScreen captureScreen;

  _SessionStarterCoordinatorBase({
    required this.widgets,
    required this.userInfo,
    required this.deepLinks,
    required this.tap,
    required this.swipe,
    required this.logic,
    required this.captureScreen,
  }) {
    initBaseCoordinatorActions();
  }

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
    await captureScreen(SessionStarterConstants.sessionStarter);
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
        ifTouchIsNotDisabled(() {
          widgets.onSwipeCoordinatesChanged(p0);
        });
      });

  initReactors() {
    disposers.add(preferredPresetReactor());
    disposers.add(deepLinkReactor());
    disposers.add(swipeCoordinatesReactor());
    disposers.add(swipeReactor());
    disposers.addAll(widgets.base.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        widgets.base.setIsDisconnected(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.base.setIsDisconnected(true);
      },
    ));
    disposers.add(nokhteSearchStatusReactor());
    disposers.add(tapReactor());
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          ifTouchIsNotDisabled(() {
            widgets.onSwipeDown(() async {
              toggleIsNavigatingAway();
              await logic.dispose(shouldNuke: true);
            });
          });
        case GestureDirections.left:
          ifTouchIsNotDisabled(() {
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

  deconstructor() {
    logic.dispose();
    dispose();
  }
}
