import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/presets/presets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

mixin SessionStarterWidgetsUtils
    on SwipeNavigationUtils, EnRoute, EnRouteConsumer, TouchRippleUtils {
  SmartTextStore get smartText;
  GestureCrossStore get gestureCross;
  CenterInstructionalNokhteStore get centerInstructionalNokhte;
  @override
  BeachWavesStore get beachWaves;
  NokhteQrCodeStore get qrCode;

  initEnterSessionJoiner() {
    if (!hasSwiped()) {
      setSwipeDirection(GestureDirections.right);
      smartText.startRotatingText(isResuming: true);
      gestureCross.cross.initOutlineFadeIn();
      centerInstructionalNokhte.setWidgetVisibility(false);
      gestureCross.initMoveAndRegenerate(CircleOffsets.right);
      beachWaves.setMovieMode(
        BeachWaveMovieModes.emptyTheOcean,
      );
      beachWaves.currentStore.initMovie(
        beachWaves.currentAnimationValues.first,
      );
    }
  }

  initExitSessionStarter() {
    if (!hasSwiped()) {
      setSwipeDirection(GestureDirections.down);
      smartText.setWidgetVisibility(false);
      gestureCross.fadeIn();
      gestureCross.initMoveAndRegenerate(CircleOffsets.bottom);
      beachWaves
          .setMovieMode(BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive);
      beachWaves.currentStore
          .initMovie(beachWaves.currentAnimationValues.first);
      centerInstructionalNokhte.setWidgetVisibility(false);
      //
    }
    //
  }

  initEnterPresets() {
    if (!hasSwiped()) {
      setSwipeDirection(GestureDirections.left);
      smartText.startRotatingText(isResuming: true);
      gestureCross.cross.initOutlineFadeIn();
      centerInstructionalNokhte.setWidgetVisibility(false);
      qrCode.setWidgetVisibility(false);
      gestureCross.initMoveAndRegenerate(CircleOffsets.left);
      beachWaves.setMovieMode(
        BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue,
      );
      beachWaves.currentStore.initMovie(
        beachWaves.currentAnimationValues.first,
      );
    }
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedOceanDive) {
            onReadyToNavigate(SessionStarterConstants.sessionStarterExit);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedOnShoreToInvertedDeeperBlue) {
            onReadyToNavigate(PresetsConstants.presetsInstructions);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.resumeOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.invertedOnShore);
            beachWaves.currentStore.initMovie(params.direction);
          }
        }
      });
}
