// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'base_home_screen_widgets_coordinator.g.dart';

class BaseHomeScreenWidgetsCoordinator = _BaseHomeScreenWidgetsCoordinatorBase
    with _$BaseHomeScreenWidgetsCoordinator;

abstract class _BaseHomeScreenWidgetsCoordinatorBase
    with Store, Reactions, SmartTextPaddingAdjuster, BaseWidgetsCoordinator {
  final NokhteBlurStore nokhteBlur;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  final InstructionalGradientNokhteStore storageInstructionalNokhte;
  final BeachWavesStore beachWaves;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _BaseHomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.touchRipple,
    required this.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
    required this.storageInstructionalNokhte,
  }) {
    // initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
  }

  @action
  constructor(Offset centerParam) {
    setCenter(centerParam);
  }

  @observable
  bool isInErrorMode = false;

  @action
  setIsInErrorMode(bool value) => isInErrorMode = value;

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool hasSwipedUp = false;

  @action
  toggleHasSwipedUp() => hasSwipedUp = !hasSwipedUp;

  @action
  onConnected() {
    setIsDisconnected(false);
  }

  @action
  onDisconnected() {
    setIsDisconnected(true);
  }

  @action
  prepForNavigation({bool excludeUnBlur = false}) {
    if (!hasSwipedUp) {
      hasSwipedUp = true;
      if (!excludeUnBlur) {
        nokhteBlur.reverse();
      }
      if (primarySmartText.currentIndex == 0) {
        primarySmartText.toggleWidgetVisibility();
      } else {
        primarySmartText.startRotatingText(isResuming: true);
      }
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
      beachWaves.currentStore
          .initMovie(beachWaves.currentAnimationValues.first);
      gestureCross.initMoveAndRegenerate(CircleOffsets.top);
    }
  }

  @action
  onSwipeCoordinatesChanged(Offset offset) {
    if (beachWaves.movieStatus != MovieStatus.finished) {
      touchRipple.onSwipe(offset);
    }
  }

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool isDoubleTriggeringWindDown = false;

  @action
  toggleIsDoubleTriggeringWindDown() =>
      isDoubleTriggeringWindDown = !isDoubleTriggeringWindDown;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  centerCrossNokhteReactor(Function onFinished) =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
          onFinished();
        }
      });

  @action
  onLongReconnected() {
    if (wifiDisconnectOverlay.movieMode ==
        WifiDisconnectMovieModes.removeTheCircle) {
      if (isDisconnected) setIsDisconnected(false);
      if (primarySmartText.isPaused) {
        primarySmartText.resume();
      }
      if (hasSwipedUp) {
        beachWaves.currentStore.setControl(Control.playFromStart);
        beachWaves.setMovieStatus(MovieStatus.inProgress);
      }
      if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToSky) {
        isEnteringNokhteSession = true;
        beachWaves.currentStore.setControl(Control.playFromStart);
      }
    }
  }

  @observable
  int onCompleteCount = 0;

  @action
  onDeepLinkOpened() {
    hasSwipedUp = true;
    isEnteringNokhteSession = true;
    primarySmartText.toggleWidgetVisibility();
    setTouchIsDisabled(true);
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToDeepSea);
    beachWaves.currentStore.initMovie(
      beachWaves.currentAnimationValues.first,
    );
    centerInstructionalNokhte.setWidgetVisibility(false);
    sessionStarterInstructionalNokhte.setWidgetVisibility(false);
    gestureCross.fadeAllOut();
  }
}
