// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_speaking_widgets_coordinator.g.dart';

class SessionSpeakingWidgetsCoordinator = _SessionSpeakingWidgetsCoordinatorBase
    with _$SessionSpeakingWidgetsCoordinator;

abstract class _SessionSpeakingWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final TouchRippleStore touchRipple;
  final SpeakLessSmileMoreStore speakLessSmileMore;
  final SessionNavigationStore sessionNavigation;
  final TintStore tint;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionSpeakingWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.sessionNavigation,
    required this.tint,
    required this.touchRipple,
    required this.speakLessSmileMore,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor(bool userCanSpeak) {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(MirroredTextContent.sessionSpeaking);
    mirroredText.startBothRotatingText();
    setIsLeaving(false);
    if (!userCanSpeak) {
      tint.initMovie(NoParams());
    }
    initReactors();
  }

  @observable
  bool isLettingGo = false;

  @observable
  bool isHolding = false;

  @observable
  bool isLeaving = false;

  @action
  setIsHolding(bool newBool) => isHolding = newBool;

  @action
  setIsLeaving(bool newBool) => isLeaving = newBool;

  @observable
  bool collaboratorHasLeft = false;

  @observable
  int holdCount = 0;

  @action
  onCollaboratorLeft() {
    mirroredText.setWidgetVisibility(false);
    sessionNavigation.setWidgetVisibility(false);
    collaboratorHasLeft = true;
  }

  @action
  onCollaboratorJoined() {
    sessionNavigation.setWidgetVisibility(true);
    mirroredText.setWidgetVisibility(true);
    collaboratorHasLeft = false;
  }

  @action
  onHold(GesturePlacement holdPosition) {
    holdCount++;
    isHolding = true;
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
    isHolding = false;
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
  onExit({
    required bool isASocraticSession,
  }) {
    setIsLeaving(true);
    mirroredText.setWidgetVisibility(false);
    tint.reverseMovie(NoParams());
    if (isASocraticSession) {
      beachWaves.setMovieMode(BeachWaveMovieModes.orangeSandToHalfAndHalf);
    } else {
      beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    }
    beachWaves.currentStore.reverseMovie(NoParams());
  }

  @action
  initReactors() {
    disposers.add(borderGlowReactor());
    disposers.add(beachWavesMovieStatusReactor());
    disposers.add(
      gestureCrossTapReactor(
        onInit: () {
          mirroredText.setWidgetVisibility(false);
        },
        onReverse: () {
          mirroredText.setWidgetVisibility(true);
        },
      ),
    );
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

  gestureCrossTapReactor({
    required Function onInit,
    required Function onReverse,
  }) =>
      reaction(
        (p0) => sessionNavigation.gestureCross.tapCount,
        (p0) {
          if (!isHolding) {
            sessionNavigation.onGestureCrossTap(onInit, onReverse);
          }
        },
      );

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.skyToHalfAndHalf) {
            if (isLeaving) {
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
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.orangeSandToHalfAndHalf) {
            Modular.to.navigate(SessionConstants.socraticSpeakingExit);
          }
        }
      });

  borderGlowReactor() => reaction((p0) => borderGlow.movieStatus, (p0) {
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
