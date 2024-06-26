// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_hybrid_widgets_coordinator.g.dart';

class SessionHybridWidgetsCoordinator = _SessionHybridWidgetsCoordinatorBase
    with _$SessionHybridWidgetsCoordinator;

abstract class _SessionHybridWidgetsCoordinatorBase with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final TouchRippleStore touchRipple;
  final SpeakLessSmileMoreStore speakLessSmileMore;
  final HalfScreenTintStore othersAreTalkingTint;
  final BaseWidgetsCoordinator base;

  _SessionHybridWidgetsCoordinatorBase({
    required this.othersAreTalkingTint,
    required WifiDisconnectOverlayStore wifiDisconnectOverlay,
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.touchRipple,
    required this.speakLessSmileMore,
  }) : base = BaseWidgetsCoordinator(
            wifiDisconnectOverlay: wifiDisconnectOverlay);

  @action
  constructor(bool userCanSpeak) {
    othersAreTalkingTint.setShouldCoverBottom(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedHalfAndHalfToDrySand);
    mirroredText.setMessagesData(MirroredTextContent.hybrid);
    mirroredText.startBothRotatingText();
    if (!userCanSpeak) {
      othersAreTalkingTint.initMovie(NoParams());
    }
    setIsPickingUp(false);
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
  bool isPickingUp = false;

  @observable
  bool isGoingToNotes = false;

  @computed
  bool get speakLessWriteMoreIsVisible => speakLessWriteMoreVisiblities.last;

  @computed
  bool get pastSpeakLessWriteMoreVisiblity =>
      speakLessWriteMoreVisiblities[speakLessWriteMoreVisiblities.length - 2];

  @observable
  ObservableList speakLessWriteMoreVisiblities =
      ObservableList.of(List.filled(2, false));

  @action
  setSpeakLessWriteMoreVisiblity(bool newVal) =>
      speakLessWriteMoreVisiblities.add(newVal);

  @action
  setIsHolding(bool newBool) => isHolding = newBool;

  @action
  setIsPickingUp(bool newBool) => isPickingUp = newBool;

  @observable
  bool collaboratorHasLeft = false;

  @observable
  int holdCount = 0;

  @observable
  int tapCount = 0;

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
    if (holdPosition == GesturePlacement.topHalf && canHold) {
      isHolding = true;
      canHold = false;
      holdCount++;
      beachWaves.setMovieMode(
        BeachWaveMovieModes.invertedHalfAndHalfToDrySand,
      );
      beachWaves.currentStore.initMovie(NoParams());
      mirroredText.setWidgetVisibility(false);
    }
  }

  @action
  onTap(Offset tapPosition) async {
    touchRipple.onTap(tapPosition, overridedColor: Colors.white);
    if (!speakLessWriteMoreIsVisible) {
      if (!isHolding && canHold) {
        tapCount++;
        if (hasTappedOnTheBottomHalf) {
          initFullScreenNotes();
        }
      }
    }
  }

  @action
  onLetGo() {
    initGlowDown();
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToInvertedHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
    speakLessSmileMore.hideBoth();
  }

  @action
  onLetGoCompleted() {
    canHold = true;
    isHolding = false;
    isLettingGo = false;
    if (!collaboratorHasLeft) {
      mirroredText.setUpsideDownVisibility(true);
    }
    if (!speakLessWriteMoreIsVisible) {
      mirroredText.setRightSideUpVisibility(true);
    }
  }

  @action
  initFullScreenNotes() {
    isGoingToNotes = true;
    mirroredText.setWidgetVisibility(false);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.skyToInvertedHalfAndHalf,
    );
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
    setIsPickingUp(true);
    mirroredText.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToInvertedHalfAndHalf);
    beachWaves.currentStore.reverseMovie(NoParams());
  }

  @action
  initReactors() {
    base.disposers.add(borderGlowReactor());
    base.disposers.add(beachWavesMovieStatusReactor());
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
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.skyToInvertedHalfAndHalf) {
            if (isPickingUp) {
              Modular.to.navigate(SessionConstants.exit);
            } else if (isGoingToNotes) {
              Modular.to.navigate(SessionConstants.hybridNotes);
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToInvertedHalfAndHalf) {
            onLetGoCompleted();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.invertedHalfAndHalfToDrySand) {
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
