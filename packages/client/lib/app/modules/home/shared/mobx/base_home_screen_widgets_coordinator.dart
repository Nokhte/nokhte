// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'base_home_screen_widgets_coordinator.g.dart';

class BaseHomeScreenWidgetsCoordinator = _BaseHomeScreenWidgetsCoordinatorBase
    with _$BaseHomeScreenWidgetsCoordinator;

abstract class _BaseHomeScreenWidgetsCoordinatorBase
    with
        Store,
        EnRoute,
        EnRouteConsumer,
        SmartTextPaddingAdjuster,
        Reactions,
        BaseWidgetsCoordinator {
  final NokhteBlurStore nokhteBlur;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;
  final SmartTextStore errorSmartText;
  final SmartTextStore secondaryErrorSmartText;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  final InstructionalGradientNokhteStore storageInstructionalNokhte;
  @override
  final BeachWavesStore beachWaves;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _BaseHomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.errorSmartText,
    required this.secondaryErrorSmartText,
    required this.touchRipple,
    required this.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
    required this.storageInstructionalNokhte,
  }) {
    initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
  }

  @action
  constructor(Offset centerParam) {
    consumeRoutingArgs();
    errorSmartText.setMessagesData(SharedLists.emptyList);
    secondaryErrorSmartText.setMessagesData(SharedLists.errorConfirmList);
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
    onResumed();
    setIsDisconnected(false);
  }

  @action
  onDisconnected() {
    setIsDisconnected(true);
    onInactive();
    if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToSky) {
      isEnteringNokhteSession = false;
      beachWaves.currentStore.setControl(Control.playReverse);
    }
  }

  @action
  onResumed() {
    if (!hasInitiatedBlur) {
      primarySmartText.startRotatingText();
      if (hasInitiatedBlur) {
        nokhteBlur.reverse();
        toggleHasInitiatedBlur();
      }
    }
  }

  @action
  onInactive() {
    if (!hasInitiatedBlur) {
      primarySmartText.reset();
      if (!hasSwipedUp && beachWaves.movieMode == BeachWaveMovieModes.onShore) {
        beachWaves.currentStore.setControl(Control.mirror);
      }
    }
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
  onError(String errorMessage) {
    errorSmartText.reset();
    secondaryErrorSmartText.reset();
    errorSmartText.setMessagesData(SharedLists.getErrorList(errorMessage));
    secondaryErrorSmartText.setMessagesData(SharedLists.errorConfirmList);
    errorSmartText.startRotatingText();
    centerInstructionalNokhte.setWidgetVisibility(false);
    sessionStarterInstructionalNokhte.setWidgetVisibility(false);
    storageInstructionalNokhte.setWidgetVisibility(false);
    secondaryErrorSmartText.startRotatingText();
    setIsInErrorMode(true);
  }

  @action
  onErrorResolved(Function onErrorResolved) {
    if (isInErrorMode) {
      if (beachWaves.movieStatus == MovieStatus.finished) {
        onErrorResolved();
        hasSwipedUp = false;
        beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
        beachWaves.currentStore.initMovie(
          AnyToOnShoreParams(startingColors: beachWaves.currentColorsAndStops),
        );
        beachWaves.setMovieStatus(MovieStatus.inProgress);
        gestureCross.cross
            .setWidgetVisibility(gestureCross.cross.pastShowWidget);
        gestureCross.centerCrossNokhte
            .setWidgetVisibility(gestureCross.centerCrossNokhte.pastShowWidget);
        gestureCross.gradientNokhte
            .setWidgetVisibility(gestureCross.gradientNokhte.pastShowWidget);
        gestureCross.strokeCrossNokhte
            .setWidgetVisibility(gestureCross.strokeCrossNokhte.pastShowWidget);
        errorSmartText.setWidgetVisibility(false);
        primarySmartText.reset();
        primarySmartText.setWidgetVisibility(true);
        primarySmartText.startRotatingText();
        secondaryErrorSmartText.setWidgetVisibility(false);
        centerInstructionalNokhte.setWidgetVisibility(true);
        sessionStarterInstructionalNokhte.setWidgetVisibility(
            sessionStarterInstructionalNokhte.pastShowWidget);
        storageInstructionalNokhte.setWidgetVisibility(
          storageInstructionalNokhte.pastShowWidget,
        );
        isEnteringNokhteSession = false;
      }
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

  beachWavesMovieStatusReactor({
    required Function onShoreToOceanDiveComplete,
    required Function onShoreToDeepSeaComplete,
    required Function onStorageEntry,
    required Function onAnyToShoreComplete,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
            onShoreToOceanDiveComplete();
          } else if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToSky) {
            onStorageEntry();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.resumeOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
          } else if (beachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
            beachWaves.currentStore.initMovie(ResumeOnShoreParams.initial());
            onAnyToShoreComplete();
            setIsInErrorMode(false);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.onShoreToDeepSea) {
            if (!isInErrorMode) {
              onShoreToDeepSeaComplete();
            }
          }
        }
      });

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
