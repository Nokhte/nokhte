// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'storage_home_widgets_coordinator.g.dart';

class StorageHomeWidgetsCoordinator = _StorageHomeWidgetsCoordinatorBase
    with _$StorageHomeWidgetsCoordinator;

abstract class _StorageHomeWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final SessionCardStore sessionCard;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore primaryInstructionalGradientNokhte;
  final NokhteBlurStore blur;
  _StorageHomeWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.sessionCard,
    required this.centerInstructionalNokhte,
    required this.primaryInstructionalGradientNokhte,
    required this.blur,
  });

  @action
  constructor(Offset offset) {
    center = offset;
    sessionCard.initFadeIn();
    primarySmartText.setMessagesData(MessagesData.storageHeader);
    setSmartTextBottomPaddingScalar(0);
    setSmartTextTopPaddingScalar(.15);
    secondarySmartText.setMessagesData(MessagesData.storageHomeSecondaryList);
    secondarySmartText.startRotatingText();
    primarySmartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    initReactors();
  }

  initReactors() {
    centerCrossNokhteReactor();
    gestureCrossTapReactor();
    centerInstructionalNokhteReactor();
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
  onSwipeLeft() {
    if (isAllowedToMakeAGesture) {
      if (!hasInitiatedBlur && !hasSwiped) {
        hasSwiped = true;
        primarySmartText.setWidgetVisibility(false);
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
        beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
        beachWaves.currentStore.initMovie(const AnyToOnShoreParams(
          startingColors: WaterColorsAndStops.vibrantBlueGrad,
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
    if (canTap && isAllowedToMakeAGesture) {
      canTap = false;
      hasSwiped = false;
      hasInitiatedBlur = false;
      secondarySmartText.startRotatingText(isResuming: true);
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.left,
      );
      primaryInstructionalGradientNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.beachWave,
          direction: InstructionalGradientDirections.shrink,
          position: InstructionalNokhtePositions.left,
        ),
      );
      blur.reverse();
    }
  }

  @action
  onGestureCrossTap() {
    if (isAllowedToMakeAGesture) {
      if (!hasInitiatedBlur && canTapOnGestureCross) {
        blur.init();
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
        //
      }
    }
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
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToDrySand);
    beachWaves.currentStore.initMovie(NoParams());
    sessionCard.setWidgetVisibility(false);
    primarySmartText.setWidgetVisibility(false);
    gestureCross.gradientNokhte.toggleWidgetVisibility();
    gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
  }

  @action
  dispose() {
    sessionCard.dispose();
  }

  @computed
  bool get isAllowedToMakeAGesture =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
