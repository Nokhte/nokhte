// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_group_hybrid_widgets_coordinator.g.dart';

class SessionGroupHybridWidgetsCoordinator = _SessionGroupHybridWidgetsCoordinatorBase
    with _$SessionGroupHybridWidgetsCoordinator;

abstract class _SessionGroupHybridWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final MirroredTextStore mirroredText;
  final BeachWavesStore beachWaves;
  final BorderGlowStore borderGlow;
  final LetEmCookStore letEmCook;
  final TouchRippleStore touchRipple;
  final SpeakLessSmileMoreStore speakLessSmileMore;
  final HalfScreenTintStore othersAreTakingNotesTint;
  final TintStore othersAreTalkingTint;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SessionNavigationStore sessionNavigation;

  _SessionGroupHybridWidgetsCoordinatorBase({
    required this.sessionNavigation,
    required this.letEmCook,
    required this.othersAreTakingNotesTint,
    required this.othersAreTalkingTint,
    required this.wifiDisconnectOverlay,
    required this.mirroredText,
    required this.beachWaves,
    required this.borderGlow,
    required this.touchRipple,
    required this.speakLessSmileMore,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor(bool someoneIsTakingANote) {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    mirroredText.setMessagesData(MirroredTextContent.hybrid);
    mirroredText.startBothRotatingText();
    if (someoneIsTakingANote) {
      othersAreTakingNotesTint.initMovie(NoParams());
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
    sessionNavigation.setWidgetVisibility(false);
    collaboratorHasLeft = true;
  }

  @action
  onCollaboratorJoined() {
    mirroredText.setWidgetVisibility(true);
    sessionNavigation.setWidgetVisibility(true);
    collaboratorHasLeft = false;
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
      sessionNavigation.setWidgetVisibility(false);
      beachWaves.currentStore.initMovie(NoParams());
      mirroredText.setWidgetVisibility(false);
    }
  }

  @action
  onSomeoneElseIsSpeaking(String speakerName) {
    letEmCook.setCurrentCook(speakerName);
    mirroredText.setWidgetVisibility(false);
    othersAreTalkingTint.initMovie(NoParams());
  }

  @action
  onSomeElseIsDoneSpreaking() {
    othersAreTalkingTint.reverseMovie(NoParams());
    mirroredText.setWidgetVisibility(true);
  }

  @action
  onTap(Offset tapPosition, Function onTap) async {
    touchRipple.onTap(tapPosition, overridedColor: const Color(0xFFFFFFFF));
    if (!speakLessWriteMoreIsVisible) {
      if (!isHolding && canHold) {
        tapCount++;
        if (hasTappedOnTheTopHalf) {
          initFullScreenNotes();
          await onTap();
        }
      }
    }
  }

  @action
  onLetGo() {
    initGlowDown();
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
  }

  @action
  onLetGoCompleted() {
    canHold = true;
    isHolding = false;
    isLettingGo = false;

    if (!collaboratorHasLeft) {
      sessionNavigation.setWidgetVisibility(true);
      mirroredText.setWidgetVisibility(true);
    }
  }

  @action
  initFullScreenNotes() {
    if (!sessionNavigation.hasInitiatedBlur) {
      isGoingToNotes = true;
      sessionNavigation.setWidgetVisibility(false);
      mirroredText.setWidgetVisibility(false);
      beachWaves.setMovieMode(
        BeachWaveMovieModes.skyToHalfAndHalf,
      );
      beachWaves.currentStore.reverseMovie(NoParams());
      othersAreTakingNotesTint.reverseMovie(NoParams());
    }
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
  onExit() {
    setIsPickingUp(true);
    mirroredText.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
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
          if (!isHolding && !isGoingToNotes) {
            sessionNavigation.onGestureCrossTap(onInit, onReverse);
          }
        },
      );

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.skyToHalfAndHalf) {
            if (isPickingUp) {
              Modular.to.navigate(SessionConstants.exit);
            } else if (isGoingToNotes) {
              Modular.to.navigate(SessionConstants.notes);
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

  borderGlowReactor() => reaction((p0) => borderGlow.currentWidth, (p0) {
        if (p0 == 200) {
          speakLessSmileMore.setSpeakLess(true);
          Timer(Seconds.get(2), () {
            if (borderGlow.currentWidth == 200) {
              speakLessSmileMore.setSmileMore(true);
            }
          });
        } else {
          if (speakLessSmileMore.showSmileMore ||
              speakLessSmileMore.showSpeakLess) {
            speakLessSmileMore.hideBoth();
          }
        }
      });

  @computed
  bool get hasTappedOnTheTopHalf =>
      touchRipple.tapPlacement == GesturePlacement.topHalf;
}
