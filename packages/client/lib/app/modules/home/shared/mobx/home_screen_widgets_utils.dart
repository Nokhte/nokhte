import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

mixin HomeScreenWidgetsUtils
    on
        Reactions,
        EnRoute,
        EnRouteConsumer,
        TouchRippleUtils,
        SmartTextPaddingAdjuster,
        SwipeNavigationUtils,
        InstructionWidgetsUtils {
  SmartTextStore get smartText;
  GestureCrossStore get gestureCross;
  initHomeUtils() {
    initInstructionWidgetsUtils();
    initSwipeNavigationUtils();
    initEnRouteActions();
    consumeRoutingArgs();
    disposers.add(beachWavesMovieStatusReactor());
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

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
            onReadyToNavigate(SessionStarterConstants.sessionStarterEntry);
          } else if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToSky) {
            onReadyToNavigate(StorageConstants.root);
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
}
