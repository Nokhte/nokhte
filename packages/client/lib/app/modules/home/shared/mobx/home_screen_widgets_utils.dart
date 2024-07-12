import 'dart:async';
import 'dart:ui';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

mixin HomeScreenWidgetsUtils
    on Reactions, EnRoute, EnRouteConsumer, SmartTextPaddingAdjuster {
  TouchRippleStore get touchRipple;
  SmartTextStore get smartText;
  GestureCrossStore get gestureCross;
  CenterInstructionalNokhteStore get centerInstructionalNokhte;
  initHomeUtils() {
    initHomeWidgetActions();
    initEnRouteActions();
    consumeRoutingArgs();
    disposers.add(beachWavesMovieStatusReactor());
  }

  onReadyToNavigate(Function onReadyToNavigate) {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) {
      if (touchRipple.movieStatus == MovieStatus.finished) {
        onReadyToNavigate();
        timer.cancel();
      }
    });
  }

  @action
  initSessionStarterTransition() {
    if (!hasSwiped() && isAllowedToMakeGesture()) {
      setSwipeDirection(GestureDirections.up);
      if (smartText.currentIndex == 0) {
        smartText.toggleWidgetVisibility();
      } else {
        smartText.startRotatingText(isResuming: true);
      }
      centerInstructionalNokhte.setWidgetVisibility(false);
      gestureCross.centerCrossNokhte.setWidgetVisibility(true);
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
      beachWaves.currentStore
          .initMovie(beachWaves.currentAnimationValues.first);
      gestureCross.initMoveAndRegenerate(CircleOffsets.top);
    }
  }

  initStorageTransition() {
    if (!hasSwiped() && isAllowedToMakeGesture()) {
      setSwipeDirection(GestureDirections.left);
      beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToSky);
      beachWaves.currentStore.initMovie(
        beachWaves.currentAnimationValues.first,
      );
      gestureCross.centerCrossNokhte.setWidgetVisibility(true);
      centerInstructionalNokhte.setWidgetVisibility(false);
      gestureCross.initMoveAndRegenerate(CircleOffsets.right);
      gestureCross.cross.initOutlineFadeIn();
      smartText.setWidgetVisibility(false);
    }
  }

  initWaterWake(Offset offset) {
    if (beachWaves.movieStatus != MovieStatus.finished ||
        beachWaves.movieMode == BeachWaveMovieModes.onShore ||
        beachWaves.movieMode == BeachWaveMovieModes.resumeOnShore) {
      touchRipple.onSwipe(offset);
    }
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
            onReadyToNavigate(() {
              Modular.to.navigate(SessionStarterConstants.sessionStarterEntry);
            });
          } else if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToSky) {
            onReadyToNavigate(() {
              Modular.to.navigate(StorageConstants.root);
            });
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.resumeOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
            beachWaves.currentStore.initMovie(params.direction);
          }
        }
      });

  centerCrossNokhteReactor(Function onFinished) =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
          onFinished();
        }
      });

  final _swipeDirection = Observable(GestureDirections.initial);
  final _hasInitiatedBlur = Observable(false);

  bool hasSwiped() => _swipeDirection.value != GestureDirections.initial;

  bool isAllowedToMakeGesture() =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;

  GestureDirections get swipeDirection => _swipeDirection.value;
  bool get hasInitiatedBlur => _hasInitiatedBlur.value;

  _setSwipeDirection(GestureDirections value) => _swipeDirection.value = value;

  _setHasInitiatedBlur(bool value) => _hasInitiatedBlur.value = value;

  Action actionSetSwipeDirection = Action(() {});
  Action actionSetHasInitiatedBlur = Action(() {});

  initHomeWidgetActions() {
    actionSetSwipeDirection = Action(_setSwipeDirection);
    actionSetHasInitiatedBlur = Action(_setHasInitiatedBlur);
  }

  setHasInitiatedBlur(bool value) {
    actionSetHasInitiatedBlur([value]);
  }

  setSwipeDirection(GestureDirections value) {
    actionSetSwipeDirection([value]);
  }
}
