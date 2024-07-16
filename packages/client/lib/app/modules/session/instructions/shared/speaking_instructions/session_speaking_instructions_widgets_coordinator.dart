// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_speaking_instructions_widgets_coordinator.g.dart';

class SessionSpeakingInstructionsWidgetsCoordinator = _SessionSpeakingInstructionsWidgetsCoordinatorBase
    with _$SessionSpeakingInstructionsWidgetsCoordinator;

abstract class _SessionSpeakingInstructionsWidgetsCoordinatorBase
    with
        Store,
        BaseWidgetsCoordinator,
        Reactions,
        SmartTextPaddingAdjuster,
        SpeakingInstructionsWidgetsUtils {
  final TouchRippleStore touchRipple;
  @override
  final BorderGlowStore borderGlow;
  @override
  final HoldTimerIndicatorStore holdTimerIndicator;
  @override
  final SmartTextStore smartText;
  @override
  final BeachWavesStore beachWaves;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionSpeakingInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.smartText,
    required this.touchRipple,
    required this.borderGlow,
    required this.holdTimerIndicator,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.halfAndHalfToDrySand);
    smartText.setMessagesData(
      SessionLists.speakingInstructionsPrimary(
        isHybrid: false,
      ),
    );
    initSpeakingInstructionUtils();
    initReactors();
    cooldownStopwatch.start();
  }

  initReactors() {
    disposers.add(smartTextIndexReactor());
  }

  @action
  onTap(Offset tapPosition) async {
    if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
      return;
    } else {
      cooldownStopwatch.reset();
    }
    touchRipple.onTap(tapPosition, adjustColorBasedOnPosition: true);
    if (hasTappedOnTheBottomHalf &&
        textIsDoneFadingInOrOut &&
        smartText.currentIndex.isLessThan(2)) {
      smartText.startRotatingText(isResuming: true);
    }
  }

  @computed
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == GesturePlacement.bottomHalf;

  @computed
  bool get textIsDoneFadingInOrOut =>
      smartText.isDoneAnimating || smartText.currentIndex == 0;
}
