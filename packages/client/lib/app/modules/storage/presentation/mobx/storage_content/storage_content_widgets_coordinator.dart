// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/shared/constants/constants.dart';
part 'storage_content_widgets_coordinator.g.dart';

class StorageContentWidgetsCoordinator = _StorageContentWidgetsCoordinatorBase
    with _$StorageContentWidgetsCoordinator;

abstract class _StorageContentWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final ContentCardStore contentCard;
  final SmartTextStore smartText;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore primaryInstructionalGradientNokhte;
  final NokhteBlurStore blur;
  _StorageContentWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
    required this.smartText,
    required this.contentCard,
    required this.centerInstructionalNokhte,
    required this.primaryInstructionalGradientNokhte,
    required this.blur,
  });

  @action
  constructor(Offset offset) {
    center = offset;
    contentCard.initFadeIn();
    smartText.setMessagesData(MessagesData.storageContentSecondaryList);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.drySandToVibrantBlueGrad);
    smartText.setStaticAltMovie(NokhteSessionConstants.blue);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    initReactors();
  }

  initReactors() {
    centerCrossNokhteReactor();
    beachWavesReactor();
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
        smartText.setWidgetVisibility(false);
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        centerInstructionalNokhte.setWidgetVisibility(false);
        beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToDrySand);
        beachWaves.currentStore.reverseMovie(NoParams());
        gestureCross.initMoveAndRegenerate(CircleOffsets.left);
        contentCard.setWidgetVisibility(false);
        gestureCross.initMoveAndRegenerate(CircleOffsets.left);
      } else if (hasInitiatedBlur && !hasSwiped) {
        smartText.setCurrentIndex(0);
        smartText.startRotatingText(isResuming: true);
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
      smartText.startRotatingText(isResuming: true);
      centerInstructionalNokhte.moveBackToCross(
        startingPosition: CenterNokhtePositions.left,
      );
      primaryInstructionalGradientNokhte.initMovie(
        InstructionalGradientMovieParams(
          center: center,
          colorway: GradientNokhteColorways.vibrantBlue,
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
            colorway: GradientNokhteColorways.vibrantBlue,
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
            colorway: GradientNokhteColorways.vibrantBlue,
            direction: InstructionalGradientDirections.shrink,
            position: InstructionalNokhtePositions.left,
          ),
        );
        //
      }
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          primaryInstructionalGradientNokhte.setWidgetVisibility(false);
          gestureCross.gradientNokhte.setWidgetVisibility(false);
          gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
        }
      });

  beachWavesReactor() =>
      reaction((p0) => beachWaves.currentStore.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate("/storage/", arguments: {
            "crossShouldGlowUp": false,
          });
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

  @action
  onSessionCardTapped() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToDrySand);
    beachWaves.currentStore.initMovie(NoParams());
    contentCard.setWidgetVisibility(false);
    smartText.setWidgetVisibility(false);
  }

  @computed
  bool get isAllowedToMakeAGesture =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
