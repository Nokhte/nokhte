// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'storage_content_widgets_coordinator.g.dart';

class StorageContentWidgetsCoordinator = _StorageContentWidgetsCoordinatorBase
    with _$StorageContentWidgetsCoordinator;

abstract class _StorageContentWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final ContentCardStore contentCard;
  final SmartTextStore smartText;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore primaryInstructionalGradientNokhte;
  final NokhteBlurStore blur;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  _StorageContentWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
    required this.smartText,
    required this.contentCard,
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
    contentCard.initFadeIn();
    smartText.setMessagesData(StorageLists.contentSecondary);
    smartText.startRotatingText();
    primaryInstructionalGradientNokhte.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.drySandToSky);
    smartText.setStaticAltMovie(SessionConstants.blue);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    initReactors();
  }

  initReactors() {
    disposers.add(centerCrossNokhteReactor());
    disposers.add(beachWavesReactor());
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
        smartText.setWidgetVisibility(false);
        gestureCross.centerCrossNokhte.setWidgetVisibility(true);
        primaryInstructionalGradientNokhte.setWidgetVisibility(false);
        centerInstructionalNokhte.setWidgetVisibility(false);
        Timer(Seconds.get(1), () {
          beachWaves.setMovieMode(BeachWaveMovieModes.skyToDrySand);
          beachWaves.currentStore.reverseMovie(NoParams());
        });
        gestureCross.initMoveAndRegenerate(CircleOffsets.left);
        contentCard.setWidgetVisibility(false);
        gestureCross.initMoveAndRegenerate(CircleOffsets.left);
      } else if (hasInitiatedBlur && !hasSwiped) {
        smartText.setCurrentIndex(0);
        smartText.startRotatingText(isResuming: true);
        hasSwiped = true;
        centerInstructionalNokhte.initMovie(InstructionalNokhtePositions.left);
      }
    }
  }

  @action
  onTap() {
    if (isAllowedToInteract && hasInitiatedBlur) {
      if (hasSwiped) {
        hasSwiped = false;
        hasInitiatedBlur = false;
        contentCard.setDisableTouchInput(false);
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
      } else if (!hasSwiped) {
        dismissInstructionalNokhtes();
      }
    }
  }

  @action
  onGestureCrossTap() {
    if (isAllowedToInteract) {
      if (!hasInitiatedBlur &&
          canTapOnGestureCross &&
          beachWaves.movieMode == BeachWaveMovieModes.drySandToSky) {
        contentCard.setDisableTouchInput(true);
        blur.init(blurValue: 20);
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
        dismissInstructionalNokhtes();
      }
    }
  }

  @action
  dismissInstructionalNokhtes() {
    contentCard.setDisableTouchInput(false);
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
          Modular.to.navigate("/storage/");
        }
      });

  centerInstructionalNokhteReactor() =>
      reaction((p0) => centerInstructionalNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (centerInstructionalNokhte.movieMode ==
              CenterInstructionalNokhteMovieModes.moveBack) {
            gestureCross.fadeIn();
          }
        }
      });

  @computed
  bool get isAllowedToInteract =>
      centerInstructionalNokhte.movieStatus != MovieStatus.inProgress;
}
