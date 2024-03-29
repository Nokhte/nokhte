// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'login_screen_widgets_coordinator.g.dart';

class LoginScreenWidgetsCoordinator = _LoginScreenWidgetsCoordinatorBase
    with _$LoginScreenWidgetsCoordinator;

abstract class _LoginScreenWidgetsCoordinatorBase extends Equatable with Store {
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final BeachWavesStore layer1BeachWaves;
  final BeachWavesStore layer2BeachWaves;
  final GestureCrossStore gestureCross;
  final SmartTextStore smartTextStore;
  final NokhteStore nokhte;
  final TrailingTextStore bottomTrailingText;
  final TrailingTextStore topTrailingText;

  _LoginScreenWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.layer1BeachWaves,
    required this.layer2BeachWaves,
    required this.gestureCross,
    required this.smartTextStore,
    required this.nokhte,
    required this.bottomTrailingText,
    required this.topTrailingText,
  });

  constructor(
    Offset center,
    Function loginBusinessLogic,
    Function onConnected,
    Function onDisconnected,
  ) {
    setCenterScreenCoordinates(center);
    layer1BeachWaves.setMovieMode(BeachWaveMovieModes.blackOut);
    layer2BeachWaves.currentStore.toggleWidgetVisibility();
    smartTextStore.setMessagesData(MessagesData.loginList);
    smartTextStore.startRotatingText();
    initReactors(loginBusinessLogic);
  }

  @observable
  bool hasNotMadeTheDot = true;

  @observable
  Offset centerScreenCoordinates = Offset.zero;
  @observable
  bool canSwipeUp = false;

  @observable
  bool hasCompletedSandTransition = false;

  @observable
  bool hasCompletedWaterFromTopToOnShorePt1 = false;

  @observable
  bool hasCompletedWaterFromTopToOnShorePt2 = false;

  @observable
  bool hasTriggeredLoginAnimation = false;

  @action
  toggleHasCompletedSandTransition() =>
      hasCompletedSandTransition = !hasCompletedSandTransition;

  @action
  toggleHasCompletedWaterFromTopToOnShorePt1() =>
      hasCompletedWaterFromTopToOnShorePt1 =
          !hasCompletedWaterFromTopToOnShorePt1;
  @action
  toggleHasCompletedWaterFromTopToOnShorePt2() =>
      hasCompletedWaterFromTopToOnShorePt2 =
          !hasCompletedWaterFromTopToOnShorePt2;

  @action
  toggleHasTriggeredLoginAnimation() =>
      hasTriggeredLoginAnimation = !hasTriggeredLoginAnimation;

  @action
  setCanSwipeUp(bool newBool) => canSwipeUp = newBool;

  @action
  toggleHasMadeTheDot() => hasNotMadeTheDot = !hasNotMadeTheDot;

  @action
  setCenterScreenCoordinates(Offset newCoordinates) =>
      centerScreenCoordinates = newCoordinates;

  @action
  loggedOutOnResumed() {
    if (bottomTrailingText.showWidget) {
      bottomTrailingText.reset();
      topTrailingText.reset();
    }
    smartTextStore.startRotatingText();
    Timer(Seconds.get(0, milli: 200), () {
      smartTextStore.startRotatingText();
    });
  }

  @action
  onLongReConnected() {
    smartTextStore.reset();
    smartTextStore.startRotatingText();
  }

  @action
  loggedOutOnInactive() {
    smartTextStore.reset();
    nokhte.reset();
    setCanSwipeUp(false);
    if (!hasNotMadeTheDot) {
      toggleHasMadeTheDot();
    }
  }

  @action
  onTap(Offset currentTapPosition) {
    if (Gestures.tap == smartTextStore.currentUnlockGesture &&
        hasNotMadeTheDot) {
      smartTextStore.startRotatingText(isResuming: true);
      toggleHasMadeTheDot();
      nokhte.initPositionMovie(
        currentTapPosition,
        centerScreenCoordinates,
      );
      if (!nokhte.showWidget) {
        nokhte.toggleWidgetVisibility();
      }
    }
  }

  @action
  onSwipeUp() {
    if (canSwipeUp) {
      topTrailingText.initReverse();
      bottomTrailingText.initReverse();
      setCanSwipeUp(false);
    }
  }

  triggerLoginAnimation() {
    if (bottomTrailingText.showWidget) {
      bottomTrailingText.toggleWidgetVisibility();
      topTrailingText.toggleWidgetVisibility();
    }
    if (smartTextStore.showWidget) {
      smartTextStore.toggleWidgetVisibility();
    }
    toggleHasTriggeredLoginAnimation();
    Timer(Seconds.get(0, milli: 500), () {
      layer1BeachWaves.setMovieMode(BeachWaveMovieModes.blackOutToDrySand);
      layer1BeachWaves.currentStore.initMovie(NoParams());
    });
  }

  @action
  loggedInOnResumed() {
    if (!hasTriggeredLoginAnimation) {
      triggerLoginAnimation();
    } else if (!hasCompletedSandTransition) {
      layer1BeachWaves.currentStore.setControl(Control.play);
    } else if (!hasCompletedWaterFromTopToOnShorePt1 ||
        !hasCompletedWaterFromTopToOnShorePt2) {
      layer2BeachWaves.currentStore.setControl(Control.play);
    }
  }

  initReactors(Function loginBusinessLogic) {
    nokhteReactor(loginBusinessLogic);
    trailingTextReactor();
    layer1BeachWavesReactor();
  }

  nokhteReactor(Function loginBusinessLogic) =>
      reaction((p0) => nokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (nokhte.movieMode == NokhteMovieModes.setPosition) {
            if (!bottomTrailingText.showWidget) {
              bottomTrailingText.toggleWidgetVisibility();
              topTrailingText.toggleWidgetVisibility();
            }
            bottomTrailingText.initMovie(NoParams());
            topTrailingText.initMovie(NoParams());
          } else if (nokhte.movieMode == NokhteMovieModes.moveUpAndApparate) {
            loginBusinessLogic();
          }
        }
      });

  trailingTextReactor() =>
      reaction((p0) => bottomTrailingText.movieStatus, (p0) {
        if (bottomTrailingText.movieStatus == MovieStatus.finished &&
            bottomTrailingText.pastControl == Control.playReverseFromEnd) {
          nokhte.initMoveUpAndApparateMovie();
        } else if (bottomTrailingText.movieStatus == MovieStatus.finished &&
            bottomTrailingText.pastControl == Control.playFromStart) {
          setCanSwipeUp(true);
        }
      });

  layer1BeachWavesReactor() =>
      reaction((p0) => layer1BeachWaves.movieStatus, (p0) {
        if (hasFinishedBlackOutToSand(p0)) {
          toggleHasCompletedSandTransition();
          layer2BeachWaves.setMovieMode(
            BeachWaveMovieModes.waterFromTopToOnShorePt1,
          );
          layer2BeachWaves.currentStore.initMovie(NoParams());
        }
      });

  layer2BeachWavesReactor(Function onPt2Finished) =>
      reaction((p0) => layer2BeachWaves.movieStatus, (p0) {
        if (hasFinishedWaterFromTopPart1(p0)) {
          layer2BeachWaves.setMovieMode(
            BeachWaveMovieModes.waterFromTopToOnShorePt2,
          );
          layer2BeachWaves.currentStore.initMovie(NoParams());
          gestureCross.fadeInTheCross();
          toggleHasCompletedWaterFromTopToOnShorePt1();
          layer2BeachWaves.currentStore.initMovie(NoParams());
        } else if (hasFinishedWaterFromTopPart2(p0)) {
          onPt2Finished();
          // Modular.to.navigate('/home/');
        }
      });

  hasFinishedBlackOutToSand(MovieStatus movieStatus) =>
      movieStatus == MovieStatus.finished &&
      layer1BeachWaves.movieMode == BeachWaveMovieModes.blackOutToDrySand;

  hasFinishedWaterFromTopPart2(MovieStatus movieStatus) =>
      movieStatus == MovieStatus.finished &&
      layer2BeachWaves.movieMode ==
          BeachWaveMovieModes.waterFromTopToOnShorePt2 &&
      hasCompletedWaterFromTopToOnShorePt1;

  hasFinishedWaterFromTopPart1(MovieStatus movieStatus) =>
      movieStatus == MovieStatus.finished &&
      layer2BeachWaves.movieMode ==
          BeachWaveMovieModes.waterFromTopToOnShorePt1 &&
      hasCompletedSandTransition;

  @override
  List<Object> get props => [];
}
