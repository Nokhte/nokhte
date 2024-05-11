// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'base_home_screen_widgets_coordinator.g.dart';

class BaseHomeScreenWidgetsCoordinator = _BaseHomeScreenWidgetsCoordinatorBase
    with _$BaseHomeScreenWidgetsCoordinator;

abstract class _BaseHomeScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;
  final SmartTextStore errorSmartText;
  final SmartTextStore secondaryErrorSmartText;
  final TouchRippleStore touchRipple;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore primaryInstructionalGradientNokhte;
  final InstructionalGradientNokhteStore secondaryInstructionalGradientNokhte;

  _BaseHomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.errorSmartText,
    required this.secondaryErrorSmartText,
    required this.touchRipple,
    required this.centerInstructionalNokhte,
    required this.primaryInstructionalGradientNokhte,
    required this.secondaryInstructionalGradientNokhte,
  });

  @action
  constructor(Offset centerParam) {
    if (Modular.args.data["resumeOnShoreParams"] != null) {
      params = Modular.args.data["resumeOnShoreParams"];
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(Modular.args.data["resumeOnShoreParams"]);
    errorSmartText.setMessagesData(SharedLists.empty);
    secondaryErrorSmartText.setMessagesData(SharedLists.errorConfirmList);
    center = centerParam;
  }

  @observable
  bool isInErrorMode = false;

  @action
  setIsInErrorMode(bool value) => isInErrorMode = value;

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool hasSwipedUp = false;

  // @observable
  // Offset center = Offset.zero;

  // @action
  // setCenter(Offset value) => center = value;

  @observable
  ResumeOnShoreParams params = ResumeOnShoreParams.initial();

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
    primaryInstructionalGradientNokhte.setWidgetVisibility(false);
    secondaryInstructionalGradientNokhte.setWidgetVisibility(false);
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
        primaryInstructionalGradientNokhte.setWidgetVisibility(
            primaryInstructionalGradientNokhte.pastShowWidget);
        secondaryInstructionalGradientNokhte.setWidgetVisibility(
          secondaryInstructionalGradientNokhte.pastShowWidget,
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

  initReactors() {
    nokhteBlurReactor();
    // centerCrossNokhteReactor();
  }

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

  nokhteBlurReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            nokhteBlur.pastControl == Control.playReverseFromEnd) {}
      });

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
    touchIsDisabled = true;
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToDeepSea);
    beachWaves.currentStore.initMovie(
      beachWaves.currentAnimationValues.first,
    );
    centerInstructionalNokhte.setWidgetVisibility(false);
    primaryInstructionalGradientNokhte.setWidgetVisibility(false);
    gestureCross.fadeAllOut();
  }
}