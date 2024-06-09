// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'session_starter_instructions_coordinator.g.dart';

class SessionStarterInstructionsCoordinator = _SessionStarterInstructionsCoordinatorBase
    with _$SessionStarterInstructionsCoordinator;

abstract class _SessionStarterInstructionsCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final SessionStarterInstructionsWidgetsCoordinator widgets;
  final UserInformationCoordinator userInformation;
  final SwipeDetector swipe;
  final TapDetector tap;
  final SessionStartersLogicCoordinator logic;

  _SessionStarterInstructionsCoordinatorBase({
    required this.widgets,
    required this.userInformation,
    required this.tap,
    required this.swipe,
    required this.logic,
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
    await userInformation.getUserInfoStore(NoParams());
    await captureScreen(SessionStarterConstants.sessionStarterInstructions);
  }

  swipeCoordinatesReactor() =>
      reaction((p0) => swipe.mostRecentCoordinates.last, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onSwipeCoordinatesChanged(p0);
        });
      });

  initReactors() {
    disposers.add(swipeCoordinatesReactor());
    disposers.add(swipeReactor());
    disposers.add(
        widgets.secondaryBeachWavesMovieStatusReactor(onAnimationComplete));
    disposers.addAll(widgets.wifiDisconnectOverlay.initReactors(
      onQuickConnected: () => setDisableAllTouchFeedback(false),
      onLongReConnected: () {
        setDisableAllTouchFeedback(false);
        widgets.setIsDisconnected(false);
      },
      onDisconnected: () {
        setDisableAllTouchFeedback(true);
        widgets.setIsDisconnected(true);
      },
    ));
    disposers.add(tapReactor());
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) => onSwipe(p0));

  @action
  onSwipe(GestureDirections direction) {
    if (!isNavigatingAway) {
      switch (direction) {
        case GestureDirections.down:
          ifTouchIsNotDisabled(() {
            widgets.onSwipeDown(() {
              toggleIsNavigatingAway();
            });
          });
        case GestureDirections.left:
          ifTouchIsNotDisabled(() {
            widgets.onSwipeLeft();
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

  @override
  deconstructor() {
    logic.dispose();
    widgets.deconstructor();
    super.deconstructor();
  }
}
