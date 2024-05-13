// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_speaking_widgets_coordinator.g.dart';

class SessionSpeakingWidgetsCoordinator = _SessionSpeakingWidgetsCoordinatorBase
    with _$SessionSpeakingWidgetsCoordinator;

abstract class _SessionSpeakingWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final TouchRippleStore touchRipple;
  final SpeakLessSmileMoreStore speakLessSmileMore;
  final TintStore tint;

  _SessionSpeakingWidgetsCoordinatorBase({
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.tint,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.speakLessSmileMore,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(MirroredTextContent.sessionSpeaking);
    mirroredText.startBothRotatingText();
    setIsPickingUp(false);
    initReactors();
  }

  @observable
  bool isLettingGo = false;

  @observable
  bool isHolding = false;

  @observable
  bool isPickingUp = false;

  @action
  setIsHolding(bool newBool) => isHolding = newBool;

  @action
  setIsPickingUp(bool newBool) => isPickingUp = newBool;

  @observable
  bool collaboratorHasLeft = false;

  @observable
  int holdCount = 0;

  @action
  onCollaboratorLeft() {
    mirroredText.setWidgetVisibility(false);
    collaboratorHasLeft = true;
  }

  @action
  onCollaboratorJoined() {
    mirroredText.setWidgetVisibility(true);
    collaboratorHasLeft = false;
  }

  @action
  onHold(GesturePlacement holdPosition) {
    holdCount++;
    if (holdPosition == GesturePlacement.topHalf) {
      DurationAndGradient params = DurationAndGradient.initial();
      params = DurationAndGradient(
        gradient: beachWaves.currentColorsAndStops,
        duration: const Duration(seconds: 2),
      );

      beachWaves.setMovieMode(BeachWaveMovieModes.anyToSky);
      beachWaves.currentStore.initMovie(params);
    } else if (holdPosition == GesturePlacement.bottomHalf) {
      beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
      beachWaves.currentStore.initMovie(NoParams());
    }
    mirroredText.setWidgetVisibility(false);
  }

  @action
  onLetGo() {
    initGlowDown();
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
    speakLessSmileMore.hideBoth();
  }

  @action
  onLetGoCompleted() {
    isLettingGo = false;
    // setCanHold(true);
    if (!collaboratorHasLeft) {
      mirroredText.setWidgetVisibility(true);
    }
  }

  @action
  setHoldBeachWaveMovie() {}

  @action
  initBorderGlow() {
    borderGlow.initMovie(NoParams());
  }

  @action
  initGlowDown() {
    borderGlow.initGlowDown();
  }

  @action
  adjustSpeakLessSmileMoreRotation(GesturePlacement holdPlacement) {
    if (holdPlacement == GesturePlacement.topHalf) {
      speakLessSmileMore.setShouldBeUpsideDown(true);
    } else {
      speakLessSmileMore.setShouldBeUpsideDown(false);
    }
  }

  @action
  onExit() {
    setIsPickingUp(true);
    mirroredText.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    beachWaves.currentStore.reverseMovie(NoParams());
  }

  @action
  initReactors() {
    firstBorderGlowReactor();
    beachWavesMovieStatusReactor();
  }

  onBorderGlowComplete(MovieStatus p0, BorderGlowStore store) {
    if (p0 == MovieStatus.finished &&
        store.isGlowingUp &&
        isHolding &&
        beachWaves.movieMode == BeachWaveMovieModes.anyToSky) {
      speakLessSmileMore.setSpeakLess(true);
      Timer(Seconds.get(2), () {
        if (isHolding) {
          speakLessSmileMore.setSmileMore(true);
        }
      });
    }
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.skyToHalfAndHalf) {
            if (isPickingUp) {
              Modular.to.navigate(SessionConstants.exit);
            } else if (isLettingGo) {
              onLetGoCompleted();
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToHalfAndHalf) {
            onLetGoCompleted();
          } else if (beachWaves.movieMode == BeachWaveMovieModes.anyToSky ||
              beachWaves.movieMode ==
                  BeachWaveMovieModes.halfAndHalfToDrySand) {
            initBorderGlow();
          }
        }
      });

  firstBorderGlowReactor() => reaction((p0) => borderGlow.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && borderGlow.isGlowingUp) {
          speakLessSmileMore.setSpeakLess(true);
          Timer(Seconds.get(2), () {
            if (borderGlow.isGlowingUp) {
              speakLessSmileMore.setSmileMore(true);
            }
          });
        }
      });
}
