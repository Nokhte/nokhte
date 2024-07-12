// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:simple_animations/simple_animations.dart';
part 'compass_and_qr_guide_widgets_coordinator.g.dart';

class CompassAndQrGuideWidgetsCoordinator = _CompassAndQrGuideWidgetsCoordinatorBase
    with _$CompassAndQrGuideWidgetsCoordinator;

abstract class _CompassAndQrGuideWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator
    with
        Store,
        Reactions,
        InstructionalNokhteWidgetUtils,
        EnRoute,
        EnRouteConsumer,
        HomeScreenWidgetsUtils,
        CompassInstructionUtils {
  @override
  final InstructionalGradientNokhteStore focusInstructionalNokhte;
  @override
  final SwipeGuideStore? swipeGuide = null;
  _CompassAndQrGuideWidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required this.focusInstructionalNokhte,
  });

  @action
  constructor(Offset center) {
    initCompassInstructionUtils();
    initHomeUtils();
    initInstructionalNokhteUtils(center);
    primarySmartText.setMessagesData(HomeLists.compassAndQrGuide);
    primarySmartText.startRotatingText();
    gestureCross.fadeInTheCross();
    gestureCross.centerCrossNokhte.setWidgetVisibility(false);
    focusInstructionalNokhte.prepareYellowDiamond(
      center,
      position: InstructionalNokhtePositions.top,
      colorway: GradientNokhteColorways.invertedBeachWave,
    );
    initReactors();
  }

  @action
  initReactors() {
    disposers.add(centerCrossNokhteReactor(() {}));
  }

  @action
  onSwipeUp() {
    if (!isDisconnected && !touchIsDisabled && isAllowedToMakeGesture()) {
      if (primarySmartText.currentIndex.equals(3)) {
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.top);
        focusInstructionalNokhte.setControl(Control.playFromStart);
        primarySmartText.startRotatingText(isResuming: true);
        setTouchIsDisabled(true);
        setSmartTextPadding(
          subMessagePadding: 110.0,
          bottomPadding: 0.0,
          topPadding: 0.0,
        );
        delayedEnableTouchFeedback();
      } else if (primarySmartText.currentIndex.equals(5)) {
        focusInstructionalNokhte.setWidgetVisibility(false);
        initSessionStarterTransition();
      }
    }
  }
}
