// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'storage_home_widgets_coordinator.g.dart';

class StorageHomeWidgetsCoordinator = _StorageHomeWidgetsCoordinatorBase
    with _$StorageHomeWidgetsCoordinator;

abstract class _StorageHomeWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final SessionCardStore sessionCard;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore primaryInstructionalGradientNokhte;
  final NokhteBlurStore blur;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  _StorageHomeWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.sessionCard,
    required this.centerInstructionalNokhte,
    required this.primaryInstructionalGradientNokhte,
    required this.blur,
  }) {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
  }

  @action
  constructor(Offset offset) {
    setCenter(offset);
    sessionCard.initFadeIn();
    primarySmartText.setMessagesData(StorageLists.homeHeader);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextTopPaddingScalar(.15);
    secondarySmartText.setMessagesData(StorageLists.homeSecondary);
    secondarySmartText.startRotatingText();
    primarySmartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    initReactors();
  }

  initReactors() {
    disposers.add(centerCrossNokhteReactor());
    disposers.add(gestureCrossTapReactor());
    disposers.add(centerInstructionalNokhteReactor());
  }

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool canTapOnGestureCross = true;

  @observable
  bool hasSwiped = false;

  @observable
  bool canTap = false;

  @action
  onSwipeRight() {
    if (isAllowedToInteract) {
      if (!hasInitiatedBlur && !hasSwiped) {
        hasSwiped = true;
        primarySmartText.setWidgetVisibility(false);
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
        beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
        beachWaves.currentStore.initMovie(const AnyToOnShoreParams(
          startingColors: WaterColorsAndStops.sky,
        ));
        gestureCross.cross.initOutlineFadeOut();
        gestureCross.initMoveAndRegenerate(CircleOffsets.left);
        sessionCard.setWidgetVisibility(false);
      } else if (hasInitiatedBlur && !hasSwiped) {
        secondarySmartText.setCurrentIndex(0);
        secondarySmartText.startRotatingText(isResuming: true);
        hasSwiped = true;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.left);
        //
      }
    }
  }

  @action
  onTap() {
    if (isAllowedToInteract) {
      if (canTap) {
        canTap = false;
        hasSwiped = false;
        hasInitiatedBlur = false;
        secondarySmartText.startRotatingText(isResuming: true);
        centerInstructionalNokhte.moveBackToCross(
          startingPosition: CenterNokhtePositions.left,
        );
        sessionCard.setDisableTouchInput(false);
        primaryInstructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.beachWave,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.left,
          ),
        );
        blur.reverse();
      } else if (hasInitiatedBlur && !hasSwiped) {
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
        hasInitiatedBlur = true;
        gestureCross.centerCrossNokhte.setWidgetVisibility(false);
        gestureCross.gradientNokhte.setWidgetVisibility(false);
        centerInstructionalNokhte.moveToCenter(center);
        primaryInstructionalGradientNokhte.setWidgetVisibility(true);
        primaryInstructionalGradientNokhte.initMovie(
          InstructionalGradientMovieParams(
            center: center,
            colorway: GradientNokhteColorways.beachWave,
            direction: InstructionalGradientDirections.enlarge,
            position: InstructionalNokhtePositions.left,
          ),
        );
      } else if (hasInitiatedBlur && !hasSwiped) {
        dismissInstructionalNokhte();
      }
    }
  }

  @action
  dismissInstructionalNokhte() {
    sessionCard.setDisableTouchInput(false);
    hasInitiatedBlur = false;
    blur.reverse();
    centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.center);
    primaryInstructionalGradientNokhte.initMovie(
      InstructionalGradientMovieParams(
        center: center,
        colorway: GradientNokhteColorways.beachWave,
        direction: InstructionalGradientDirections.shrink,
        position: InstructionalNokhtePositions.left,
      ),
    );
  }

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          primaryInstructionalGradientNokhte.setWidgetVisibility(false);
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            centerInstructionalNokhte.movieMode ==
                CenterInstructionalNokhteMovieModes.moveAround) {
          canTap = true;
          //
        }
      });

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
    gestureCross.gradientNokhte.setWidgetVisibility(false);
    gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    primaryInstructionalGradientNokhte.setWidgetVisibility(false);
  }

  deconstructor() {
    sessionCard.dispose();
    dispose();
  }

  @computed
  bool get isAllowedToInteract =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
