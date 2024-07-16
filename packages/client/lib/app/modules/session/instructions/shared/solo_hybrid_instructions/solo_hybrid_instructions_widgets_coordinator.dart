// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'solo_hybrid_instructions_widgets_coordinator.g.dart';

class SoloHybridInstructionsWidgetsCoordinator = _SoloHybridInstructionsWidgetsCoordinatorBase
    with _$SoloHybridInstructionsWidgetsCoordinator;

abstract class _SoloHybridInstructionsWidgetsCoordinatorBase
    with
        Store,
        SmartTextPaddingAdjuster,
        BaseWidgetsCoordinator,
        Reactions,
        SpeakingInstructionsWidgetsUtils {
  @override
  final SmartTextStore smartText;
  @override
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  @override
  final BorderGlowStore borderGlow;
  @override
  final HoldTimerIndicatorStore holdTimerIndicator;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SoloHybridInstructionsWidgetsCoordinatorBase({
    required this.wifiDisconnectOverlay,
    required this.smartText,
    required this.beachWaves,
    required this.touchRipple,
    required this.borderGlow,
    required this.holdTimerIndicator,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    smartText.setMessagesData(SessionLists.soloHybridInstructions);
    initReactors();
    initSpeakingInstructionUtils();
  }

  initReactors() {
    disposers.add(smartTextIndexReactor());
    disposers.add(beachWavesMovieStatusReactor(
      hasPostSpeakingInstructions: true,
    ));
    disposers.add(rippleCompletionStatusReactor());
  }

  @action
  onTap(Offset tapPosition) async {
    if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
      return;
    } else {
      cooldownStopwatch.reset();
    }
    touchRipple.onTap(
      tapPosition,
      adjustColorBasedOnPosition: true,
    );
    if ((smartText.currentIndex.isLessThan(2) && hasTappedOnTheBottomHalf) ||
        (smartText.currentIndex.isGreaterThan(6) && hasTappedOnTheTopHalf)) {
      smartText.startRotatingText(isResuming: true);
      if (smartText.currentIndex == 8) {
        beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToHalfAndHalf);
        beachWaves.currentStore.reverseMovie(NoParams());
      }
    } else if (smartText.currentIndex == 2) {
      initSpeakingMode();
    } else if (smartText.currentIndex == 6) {
      revertSpeakingMode();
    } else {
      if (smartText.currentIndex == 2) {
        initSpeakingMode();
      } else if (smartText.currentIndex == 4) {
        revertSpeakingMode();
      }
    }
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            smartText.currentIndex.isGreaterThanOrEqualTo(8)) {
          Modular.to.navigate(SessionConstants.lobby);
        }
      });

  @computed
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == GesturePlacement.bottomHalf;

  @computed
  bool get hasTappedOnTheTopHalf =>
      touchRipple.tapPlacement == GesturePlacement.topHalf;
}
