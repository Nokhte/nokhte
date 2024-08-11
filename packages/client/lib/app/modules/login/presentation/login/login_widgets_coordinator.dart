// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/login/login.dart';
import 'package:simple_animations/simple_animations.dart';
part 'login_widgets_coordinator.g.dart';

class LoginScreenWidgetsCoordinator = _LoginScreenWidgetsCoordinatorBase
    with _$LoginScreenWidgetsCoordinator;

abstract class _LoginScreenWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore layer1BeachWaves;
  final BeachWavesStore layer2BeachWaves;
  final GestureCrossStore gestureCross;
  final SmartTextStore smartTextStore;
  final LoginNokhtesStore loginNokhtes;
  final TrailingTextStore bottomTrailingText;
  final TrailingTextStore topTrailingText;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _LoginScreenWidgetsCoordinatorBase({
    required this.layer1BeachWaves,
    required this.layer2BeachWaves,
    required this.gestureCross,
    required this.smartTextStore,
    required this.loginNokhtes,
    required this.bottomTrailingText,
    required this.topTrailingText,
    required this.wifiDisconnectOverlay,
  }) {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
  }

  constructor(
    Offset center,
    Function loginBusinessLogic,
    Function onConnected,
    Function onDisconnected,
  ) {
    loginNokhtes.setCenterCoordinates(center);
    setCenterScreenCoordinates(center);

    layer1BeachWaves.setMovieMode(BeachWaveMovieModes.blackOutToDrySand);
    layer2BeachWaves.currentStore.setWidgetVisibility(false);
    smartTextStore.setMessagesData(LoginList.list);
    smartTextStore.startRotatingText();
    initReactors(loginBusinessLogic);
    setSmartTextSubMessagePaddingScalar(200);
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
    if (!hasNotMadeTheDot && !canSwipeUp) {
      Timer(Seconds.get(1), () {
        loginNokhtes.reset();
        Timer(Seconds.get(2), () {
          bottomTrailingText.initMovie(NoParams());
          topTrailingText.initMovie(NoParams());
        });
      });
    }
  }

  @action
  onLongReConnected() {
    smartTextStore.reset();
    smartTextStore.startRotatingText();
  }

  @action
  onTap(Offset currentTapPosition) {
    if (smartTextStore.currentIndex == 1 && hasNotMadeTheDot) {
      smartTextStore.startRotatingText(isResuming: true);
      toggleHasMadeTheDot();
      loginNokhtes.initPositionMovie(
        currentTapPosition,
        centerScreenCoordinates,
      );
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
    bottomTrailingText.setWidgetVisibility(false);
    topTrailingText.setWidgetVisibility(false);
    smartTextStore.setWidgetVisibility(false);
    loginNokhtes.setWidgetVisibility(false);
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
    disposers.add(nokhteReactor(loginBusinessLogic));
    disposers.add(trailingTextReactor());
    disposers.add(layer1BeachWavesReactor());
  }

  nokhteReactor(Function loginBusinessLogic) =>
      reaction((p0) => loginNokhtes.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (loginNokhtes.movieMode == LoginNokhtesMovieModes.setPosition) {
            if (!bottomTrailingText.showWidget) {
              bottomTrailingText.setWidgetVisibility(false);
              topTrailingText.setWidgetVisibility(false);
            }
            bottomTrailingText.initMovie(NoParams());
            topTrailingText.initMovie(NoParams());
          } else if (loginNokhtes.movieMode ==
              LoginNokhtesMovieModes.moveUpAndApparate) {
            loginBusinessLogic();
          }
        }
      });

  trailingTextReactor() =>
      reaction((p0) => bottomTrailingText.movieStatus, (p0) {
        if (bottomTrailingText.movieStatus == MovieStatus.finished &&
            bottomTrailingText.pastControl == Control.playReverseFromEnd) {
          loginNokhtes.initMoveUpAndApparateMovie();
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
}
