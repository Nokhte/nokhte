// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_hybrid_widgets_coordinator.g.dart';

class SessionHybridWidgetsCoordinator = _SessionHybridWidgetsCoordinatorBase
    with _$SessionHybridWidgetsCoordinator;

abstract class _SessionHybridWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final TouchRippleStore touchRipple;
  final SpeakLessSmileMoreStore speakLessSmileMore;
  final HalfScreenTintStore speakLessWriteMoreTint;
  final HalfScreenTintStore othersAreTalkingTint;
  final SmartTextStore smartText;

  _SessionHybridWidgetsCoordinatorBase({
    required this.othersAreTalkingTint,
    required this.mirroredText,
    required this.speakLessWriteMoreTint,
    required this.smartText,
    required this.beachWaves,
    required this.borderGlow,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.speakLessSmileMore,
  });

  @action
  constructor() {
    othersAreTalkingTint.setShouldCoverBottom(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.invertedHalfAndHalfToDrySand);
    mirroredText.setMessagesData(MirroredTextContent.hybrid);
    smartText.setMessagesData(SessionLists.speakLessWriteMore);
    smartText.setStaticAltMovie(NokhteSessionConstants.blue);
    smartText.startRotatingText();
    smartText.setWidgetVisibility(false);
    mirroredText.startBothRotatingText();
    setIsPickingUp(false);
    isGoingToNotes = false;
    initReactors();
    speakLessWriteMoreTint.setTintColor(Colors.white);
    Timer(const Duration(minutes: 9), () {
      if (tapCount == 0) {
        initSpeakLessWriteMore();
      }
    });
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
  initSpeakLessWriteMore() {
    smartText.setWidgetVisibility(true);
    speakLessWriteMoreTint.setControl(Control.playFromStart);
    mirroredText.setRightsideUpVisibility(false);
    setSpeakLessWriteMoreVisiblity(true);
  }

  @action
  reverseSpeakLessWriteMore() {
    smartText.setWidgetVisibility(false);
    speakLessWriteMoreTint.setControl(Control.playReverse);
    if (!isHolding) {
      mirroredText.setRightsideUpVisibility(true);
    }
    if (collaboratorHasLeft) {
      mirroredText.setRightsideUpVisibility(false);
    }
    setSpeakLessWriteMoreVisiblity(false);
  }

  @action
  onCollaboratorLeft() {
    mirroredText.setWidgetVisibility(false);
    collaboratorHasLeft = true;
    if (speakLessWriteMoreIsVisible) {
      reverseSpeakLessWriteMore();
    }
  }

  @action
  onCollaboratorJoined() {
    mirroredText.setWidgetVisibility(true);
    collaboratorHasLeft = false;
    if (pastSpeakLessWriteMoreVisiblity) {
      initSpeakLessWriteMore();
    }
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
      if (speakLessWriteMoreIsVisible) {
        reverseSpeakLessWriteMore();
      }
    }
  }

  @action
  onTap(
    Offset tapPosition, {
    required Function onTap,
  }) async {
    touchRipple.onTap(tapPosition, overridedColor: Colors.white);
    if (!speakLessWriteMoreIsVisible) {
      if (!isHolding && canHold) {
        await onTap();
        tapCount++;
        if (hasTappedOnTheBottomHalf) {
          initFullScreenNotes();
        }
      }
    } else {
      if (hasTappedOnTheBottomHalf) {
        reverseSpeakLessWriteMore();
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
    if (pastSpeakLessWriteMoreVisiblity) {
      initSpeakLessWriteMore();
    }
    if (!collaboratorHasLeft) {
      mirroredText.setUpsideDownVisibility(true);
    }
    if (!speakLessWriteMoreIsVisible) {
      mirroredText.setRightsideUpVisibility(true);
    }
  }

  @action
  initFullScreenNotes() {
    isGoingToNotes = true;
    mirroredText.setWidgetVisibility(false);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.vibrantBlueGradToInvertedHalfAndHalf,
    );
    beachWaves.currentStore.reverseMovie(NoParams());
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
    beachWaves
        .setMovieMode(BeachWaveMovieModes.vibrantBlueGradToInvertedHalfAndHalf);
    beachWaves.currentStore.reverseMovie(NoParams());
    if (speakLessWriteMoreIsVisible) {
      reverseSpeakLessWriteMore();
    }
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
        beachWaves.movieMode == BeachWaveMovieModes.anyToVibrantBlueGrad) {
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
              BeachWaveMovieModes.vibrantBlueGradToInvertedHalfAndHalf) {
            if (isPickingUp) {
              Modular.to.navigate("/session/shared/exit");
            } else if (isGoingToNotes) {
              Modular.to.navigate("/session/hybrid/notes");
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

  @computed
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == GesturePlacement.bottomHalf;
}
