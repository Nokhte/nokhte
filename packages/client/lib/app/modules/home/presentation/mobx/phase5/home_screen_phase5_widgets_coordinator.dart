// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_phase5_widgets_coordinator.g.dart';

class HomeScreenPhase5WidgetsCoordinator = _HomeScreenPhase5WidgetsCoordinatorBase
    with _$HomeScreenPhase5WidgetsCoordinator;

abstract class _HomeScreenPhase5WidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _HomeScreenPhase5WidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.errorSmartText,
    required super.secondaryErrorSmartText,
    required super.touchRipple,
    required super.centerInstructionalNokhte,
    required super.instructionalGradientNokhte,
  });

  @observable
  bool gracePeriodHasExpired = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    gestureCross.fadeIn();
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  onSwipeUp() {
    prepForNavigation();
  }

  @action
  @override
  initReactors() {
    super.initReactors();
    gestureCrossTapReactor();
  }

  @observable
  bool hasSwiped = false;

  @action
  onSwipeRight() {
    if (!hasSwiped) {
      hasSwiped = true;
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
      beachWaves.currentStore.initMovie(
        beachWaves.currentAnimationValues.first,
      );
      gestureCross.initMoveAndRegenerate(CircleOffsets.right);
      gestureCross.cross.initOutlineFadeIn();
      primarySmartText.setWidgetVisibility(false);
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  onGestureCrossTap() {
    if (!hasInitiatedBlur && !isEnteringNokhteSession) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
      primarySmartText.startRotatingText(isResuming: true);
    }
  }
}
