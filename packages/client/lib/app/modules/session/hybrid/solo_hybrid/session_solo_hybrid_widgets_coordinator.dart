// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_solo_hybrid_widgets_coordinator.g.dart';

class SessionSoloHybridWidgetsCoordinator = _SessionSoloHybridWidgetsCoordinatorBase
    with _$SessionSoloHybridWidgetsCoordinator;

abstract class _SessionSoloHybridWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions, TouchRippleUtils {
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final BorderGlowStore borderGlow;
  final SpeakLessSmileMoreStore speakLessSmileMore;
  final HalfScreenTintStore othersAreTalkingTint;
  @override
  final BeachWavesStore beachWaves;
  @override
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionSoloHybridWidgetsCoordinatorBase({
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.othersAreTalkingTint,
    required this.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.borderGlow,
    required this.touchRipple,
    required this.speakLessSmileMore,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor(bool userCanSpeak) {
    tapStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    primarySmartText.setMessagesData(SessionLists.tapToTalk);
    secondarySmartText.setMessagesData(SessionLists.tapToTakeANote);
    primarySmartText.setStaticAltMovie(SessionConstants.blue);
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
    if (!userCanSpeak) {
      othersAreTalkingTint.initMovie(NoParams());
    }
    setIsExiting(false);
    isGoingToNotes = false;
    initReactors();
  }

  @observable
  bool isLettingGo = false;

  @observable
  bool isHolding = false;

  @observable
  bool canTap = false;

  @observable
  bool canHold = true;

  @observable
  bool isExiting = false;

  @observable
  bool isGoingToNotes = false;

  @action
  setIsHolding(bool newBool) => isHolding = newBool;

  @action
  setIsExiting(bool newBool) => isExiting = newBool;

  @observable
  bool collaboratorHasLeft = false;

  @observable
  int holdCount = 0;

  @observable
  int letGoCount = 0;

  @observable
  int tapCount = 0;

  Stopwatch tapStopwatch = Stopwatch();

  @action
  onCollaboratorLeft() {
    setSmartTextVisibilities(false);
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    collaboratorHasLeft = true;
  }

  @action
  onCollaboratorJoined() {
    collaboratorHasLeft = false;
    primarySmartText.setWidgetVisibility(true);
    secondarySmartText.setWidgetVisibility(true);
  }

  @action
  setSmartTextVisibilities(bool newVisibility) {
    primarySmartText.setWidgetVisibility(newVisibility);
    secondarySmartText.setWidgetVisibility(newVisibility);
  }

  @action
  onHold(GesturePlacement holdPosition) {
    if (holdPosition == GesturePlacement.bottomHalf && canHold) {
      isHolding = true;
      canHold = false;
      holdCount++;
      beachWaves.setMovieMode(
        BeachWaveMovieModes.halfAndHalfToDrySand,
      );
      beachWaves.currentStore.initMovie(NoParams());
      setSmartTextVisibilities(false);
    }
  }

  @action
  onTap({
    required Offset tapPosition,
    required GesturePlacement tapPlacement,
    required Function asyncTapCall,
  }) async {
    if (tapStopwatch.elapsedMilliseconds > 1000 || tapCount == 0) {
      touchRipple.onTap(tapPosition, adjustColorBasedOnPosition: true);
      if (tapPlacement == GesturePlacement.topHalf) {
        if (!isHolding && canHold && !collaboratorHasLeft) {
          initFullScreenNotes();
        }
      } else {
        await asyncTapCall();
      }
      tapCount++;
      tapStopwatch.reset();
    }
  }

  @action
  onLetGo() {
    letGoCount++;
    initGlowDown();
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
    speakLessSmileMore.hideBoth();
  }

  @action
  onLetGoCompleted() {
    canHold = true;
    isHolding = false;
    isLettingGo = false;
    if (!collaboratorHasLeft) {
      setSmartTextVisibilities(true);
    }
  }

  @action
  initFullScreenNotes() {
    tapStopwatch.stop();
    isGoingToNotes = true;
    setSmartTextVisibilities(false);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.skyToHalfAndHalf,
    );
    setSmartTextVisibilities(false);
    beachWaves.currentStore.reverseMovie(NoParams());
    othersAreTalkingTint.reverseMovie(NoParams());
    //
  }

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
    tapStopwatch.stop();
    setIsExiting(true);
    setSmartTextVisibilities(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    setSmartTextVisibilities(false);
    beachWaves.currentStore.reverseMovie(NoParams());
    othersAreTalkingTint.reverseMovie(NoParams());
  }

  @action
  initReactors() {
    disposers.add(borderGlowReactor());
    disposers.add(beachWavesMovieStatusReactor());
  }

  onBorderGlowComplete(MovieStatus p0, BorderGlowStore store) {
    if (p0 == MovieStatus.finished &&
        store.isGlowingUp &&
        isHolding &&
        beachWaves.movieMode == BeachWaveMovieModes.halfAndHalfToDrySand) {
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
            if (isExiting) {
              onReadyToNavigate(SessionConstants.exit);
            } else if (isGoingToNotes) {
              onReadyToNavigate(SessionConstants.notes);
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToHalfAndHalf) {
            onLetGoCompleted();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.halfAndHalfToDrySand) {
            initBorderGlow();
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

  @computed
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == GesturePlacement.bottomHalf;
}
