// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'session_starter_instructions_coordinator.g.dart';

class SessionStarterInstructionsCoordinator = _SessionStarterInstructionsCoordinatorBase
    with _$SessionStarterInstructionsCoordinator;

abstract class _SessionStarterInstructionsCoordinatorBase with Store {
  final SessionStarterInstructionsWidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final TapDetector tap;
  final SessionStartersLogicCoordinator logic;
  final BaseCoordinator base;

  _SessionStarterInstructionsCoordinatorBase({
    required this.widgets,
    required this.tap,
    required this.swipe,
    required this.logic,
    required CaptureScreen captureScreen,
  }) : base = BaseCoordinator(captureScreen: captureScreen);

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
    await base
        .captureScreen(SessionStarterConstants.sessionStarterInstructions);
  }

  swipeCoordinatesReactor() =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        base.ifTouchIsNotDisabled(() {
          widgets.onSwipeCoordinatesChanged(p0);
        });
      });

  initReactors() {
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
    base.disposers.add(tapReactor());
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          base.ifTouchIsNotDisabled(() {
            widgets.onSwipeDown(() {
              toggleIsNavigatingAway();
            });
          });
        case GestureDirections.left:
          base.ifTouchIsNotDisabled(() {
            widgets.onSwipeLeft();
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

  deconstructor() {
    logic.dispose();
    widgets.base.deconstructor();
    base.deconstructor();
  }
}
