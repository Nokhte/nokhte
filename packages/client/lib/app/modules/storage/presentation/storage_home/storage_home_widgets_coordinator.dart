// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/shared/mobx/home_navigation.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'storage_home_widgets_coordinator.g.dart';

class StorageHomeWidgetsCoordinator = _StorageHomeWidgetsCoordinatorBase
    with _$StorageHomeWidgetsCoordinator;

abstract class _StorageHomeWidgetsCoordinatorBase
    with
        Store,
        SmartTextPaddingAdjuster,
        BaseWidgetsCoordinator,
        InstructionWidgetsUtils,
        SwipeNavigationUtils,
        Reactions,
        HomeNavigation {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final SessionCardStore sessionCard;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  @override
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  @override
  final InstructionalGradientNokhteStore homeInstructionalNokhte;
  @override
  final SwipeGuideStore swipeGuide;
  final NokhteBlurStore blur;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  _StorageHomeWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
    required this.swipeGuide,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.sessionCard,
    required this.centerInstructionalNokhte,
    required this.homeInstructionalNokhte,
    required this.blur,
  }) {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    initSwipeNavigationUtils();
    initInstructionWidgetsUtils();
  }

  @action
  constructor(Offset offset) {
    setCenter(offset);
    sessionCard.initFadeIn();
    homeInstructionalNokhte.setAndFadeIn(
      InstructionalNokhtePositions.left,
      GradientNokhteColorways.beachWave,
    );
    primarySmartText.setMessagesData(StorageLists.homeHeader);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextTopPaddingScalar(.15);
    secondarySmartText.setMessagesData(StorageLists.homeSecondary);
    secondarySmartText.startRotatingText();
    primarySmartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    gestureCross.cross.initStaticGlow();
    gestureCross.fadeInTheCross();
    centerInstructionalNokhte.fadeIn();
    homeInstructionalNokhte.setAndFadeIn(
      InstructionalNokhtePositions.left,
      GradientNokhteColorways.beachWave,
    );

    initReactors();
  }

  initReactors() {
    // disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(centerInstructionalNokhteReactor());
    initHomeNavigationReactions();
  }

  @observable
  bool canTapOnGestureCross = true;

  @observable
  bool canTap = false;

  @action
  onSwipeLeft() {
    if (!isDisconnected && isAllowedToMakeGesture()) {
      if (hasInitiatedBlur && !hasSwiped()) {
        setSwipeDirection(GestureDirections.left);
        swipeGuide.setWidgetVisibility(false);
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.left);
      }
    }
  }

  @action
  onTap() {
    if (isAllowedToInteract) {
      if (canTap) {
        canTap = false;
        setSwipeDirection(GestureDirections.initial);
        setHasInitiatedBlur(false);
        secondarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveBackToCross(
          startingPosition: CenterNokhtePositions.left,
        );
        sessionCard.setDisableTouchInput(false);
        homeInstructionalNokhte.initMovie(
          InstructionalGradientDirections.shrink,
        );
        blur.reverse();
      } else if (hasInitiatedBlur && !hasSwiped()) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  onGestureCrossTap() {
    if (isAllowedToInteract) {
      if (!hasInitiatedBlur &&
          canTapOnGestureCross &&
          beachWaves.movieMode == BeachWaveMovieModes.skyToHalfAndHalf) {
        sessionCard.setDisableTouchInput(true);
        blur.init();
        sessionCard.setDisableTouchInput(true);
        swipeGuide.fadeIn();
        setHasInitiatedBlur(true);
        // gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        // gestureCross.gradientNokhte.setWidgetVisibility(false);
        centerInstructionalNokhte.moveToCenter();
        homeInstructionalNokhte.setWidgetVisibility(true);
        homeInstructionalNokhte.initMovie(
          InstructionalGradientDirections.enlarge,
        );
      } else if (hasInitiatedBlur && !hasSwiped()) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  dismissInstructionalNokhte() {
    sessionCard.setDisableTouchInput(false);
    setHasInitiatedBlur(false);
    blur.reverse();
    centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.center);
    homeInstructionalNokhte.initMovie(
      InstructionalGradientDirections.shrink,
    );
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  onSessionCardTapped() {
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToDrySand);
    beachWaves.currentStore.initMovie(NoParams());
    sessionCard.setWidgetVisibility(false);
    primarySmartText.setWidgetVisibility(false);
    centerInstructionalNokhte.setWidgetVisibility(false);
    gestureCross.cross.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    homeInstructionalNokhte.setWidgetVisibility(false);
  }

  deconstructor() {
    sessionCard.dispose();
    dispose();
  }

  @computed
  bool get isAllowedToInteract =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
