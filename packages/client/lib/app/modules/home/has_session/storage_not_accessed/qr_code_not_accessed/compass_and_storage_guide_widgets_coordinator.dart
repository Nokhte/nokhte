// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'compass_and_storage_guide_widgets_coordinator.g.dart';

class CompassAndStorageGuideWidgetsCoordinator = _CompassAndStorageGuideWidgetsCoordinatorBase
    with _$CompassAndStorageGuideWidgetsCoordinator;

abstract class _CompassAndStorageGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator
    with
        Store,
        Reactions,
        InstructionalNokhteWidgetUtils,
        EnRoute,
        EnRouteConsumer,
        SwipeNavigationUtils,
        InstructionWidgetsUtils,
        TouchRippleUtils,
        HomeScreenWidgetsUtils,
        CompassInstructionUtils {
  @override
  final SwipeGuideStore swipeGuide;
  @override
  final InstructionalGradientNokhteStore focusInstructionalNokhte;

  InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  _CompassAndStorageGuideWidgetsCoordinatorBase({
    required this.swipeGuide,
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.smartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
    required this.focusInstructionalNokhte,
  });

  @observable
  bool hasTappedOnGestureCross = false;

  @action
  constructor(Offset center) {
    initHomeUtils();
    initCompassInstructionUtils();
    initInstructionalNokhteUtils(center);
    swipeGuide.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    smartText.setMessagesData(HomeLists.compassAndStorageGuide);
    focusInstructionalNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.right,
      colorway: GradientNokhteColorways.vibrantBlue,
    );
    smartText.startRotatingText();
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(centerCrossNokhteReactor(() {
      focusInstructionalNokhte.setWidgetVisibility(false);
    }));
  }

  @action
  onSwipeLeft() {
    if (!isDisconnected && isAllowedToMakeAGesture) {
      if (smartText.currentIndex == 3) {
        setSwipeDirection(GestureDirections.left);
        swipeGuide.setWidgetVisibility(false);
        centerInstructionalNokhte.initMovie(
          InstructionalNokhtePositions.right,
        );
        focusInstructionalNokhte.setControl(Control.playFromStart);
        smartText.startRotatingText(isResuming: true);
        setSmartTextPadding(subMessagePadding: 120, topPadding: .15);
        delayedEnableTouchFeedback();
      } else if (smartText.currentIndex == 5) {
        initStorageTransition();
      }
    }
  }

  @computed
  bool get isAllowedToMakeAGesture =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
