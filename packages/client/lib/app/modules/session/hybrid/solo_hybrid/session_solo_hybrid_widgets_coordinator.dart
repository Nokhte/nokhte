// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:ui';
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
  final SessionNavigationStore sessionNavigation;
  final BorderGlowStore borderGlow;
  final SpeakLessSmileMoreStore speakLessSmileMore;
  final HalfScreenTintStore othersAreTalkingTint;
  final RallyStore rally;
  @override
  final BeachWavesStore beachWaves;
  @override
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionSoloHybridWidgetsCoordinatorBase({
    required this.primarySmartText,
    required this.rally,
    required this.secondarySmartText,
    required this.sessionNavigation,
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

  @observable
  bool isASecondarySpeaker = false;

  @observable
  DateTime speakingTimerStart = DateTime.fromMillisecondsSinceEpoch(0);

  Stopwatch tapStopwatch = Stopwatch();

  @action
  onCollaboratorLeft() {
    setSmartTextVisibilities(false);
    primarySmartText.setWidgetVisibility(false);
    sessionNavigation.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    collaboratorHasLeft = true;
  }

  @action
  onCollaboratorJoined() {
    collaboratorHasLeft = false;
    primarySmartText.setWidgetVisibility(true);
    sessionNavigation.setWidgetVisibility(true);
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
      sessionNavigation.setWidgetVisibility(false);
      beachWaves.setMovieMode(
        BeachWaveMovieModes.halfAndHalfToDrySand,
      );

      beachWaves.currentStore.initMovie(NoParams());
      setSmartTextVisibilities(false);
    }
  }

  @action
  setCollaboratorNames(List<String> collaboratorNames) {
    rally.setCollaborators(collaboratorNames);
  }

  @action
  onTap({
    required Offset tapPosition,
    required GesturePlacement tapPlacement,
    required Function asyncTalkingTapCall,
    required Function asyncNotesTapCall,
  }) async {
    if ((tapStopwatch.elapsedMilliseconds > 1000 || tapCount == 0) &&
        !sessionNavigation.hasInitiatedBlur) {
      touchRipple.onTap(tapPosition, adjustColorBasedOnPosition: true);
      if (tapPlacement == GesturePlacement.topHalf) {
        if (!isHolding &&
            canHold &&
            !collaboratorHasLeft &&
            !isASecondarySpeaker) {
          initFullScreenNotes();
          await asyncNotesTapCall();
        } else if (isHolding) {
          await asyncTalkingTapCall();
        }
      } else {
        await asyncTalkingTapCall();
      }
      tapCount++;
      tapStopwatch.reset();
    }
  }

  @action
  onLetGo() {
    letGoCount++;
    borderGlow.initGlowDown();

    rally.reset();
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToHalfAndHalf);
    beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
  }

  @action
  onLetGoCompleted() {
    canHold = true;
    isHolding = false;
    isLettingGo = false;
    isASecondarySpeaker = false;
    speakingTimerStart = DateTime.fromMillisecondsSinceEpoch(0);
    if (!collaboratorHasLeft) {
      setSmartTextVisibilities(true);
      sessionNavigation.setWidgetVisibility(true);
    }
  }

  @action
  initFullScreenNotes() {
    tapStopwatch.stop();
    isGoingToNotes = true;
    sessionNavigation.setWidgetVisibility(false);
    setSmartTextVisibilities(false);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.skyToHalfAndHalf,
    );
    setSmartTextVisibilities(false);
    beachWaves.currentStore.reverseMovie(NoParams());
    othersAreTalkingTint.reverseMovie(NoParams());
  }

  @action
  initBorderGlow() {
    if (isASecondarySpeaker) {
      rally.setRallyPhase(RallyPhase.activeRecipient);
      borderGlow.synchronizeGlow(speakingTimerStart);
    } else {
      borderGlow.initMovie(NoParams());
      rally.setRallyPhase(RallyPhase.initial);
    }
  }

  @action
  synchronizeBorderGlow({
    required DateTime startTime,
    required String initiatorFullName,
  }) {
    speakingTimerStart = startTime;
    isASecondarySpeaker = true;
    sessionNavigation.setWidgetVisibility(false);
    rally.setCurrentInitiator(initiatorFullName);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.halfAndHalfToDrySand,
    );
    othersAreTalkingTint.reverseMovie(NoParams());
    beachWaves.currentStore.initMovie(NoParams());
    setSmartTextVisibilities(false);
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
    disposers.add(
      gestureCrossTapReactor(
        onInit: () {
          primarySmartText.setWidgetVisibility(false);
          secondarySmartText.setWidgetVisibility(false);
        },
        onReverse: () {
          primarySmartText.setWidgetVisibility(true);
          secondarySmartText.setWidgetVisibility(true);
        },
      ),
    );
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

  beachWavesMovieStatusReactor({
    required Function onBorderGlowInitialized,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) async {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.skyToHalfAndHalf) {
            onReadyToNavigate(SessionConstants.notes);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.anyToHalfAndHalf) {
            onLetGoCompleted();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.halfAndHalfToDrySand) {
            initBorderGlow();
            await onBorderGlowInitialized();
          }
        }
      });

  borderGlowReactor() => reaction((p0) => borderGlow.currentWidth, (p0) {
        if (p0 == 200 && !isASecondarySpeaker) {
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
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == GesturePlacement.bottomHalf;
}
