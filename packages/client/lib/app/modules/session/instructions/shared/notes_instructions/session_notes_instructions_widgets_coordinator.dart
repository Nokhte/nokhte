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
part 'session_notes_instructions_widgets_coordinator.g.dart';

class SessionNotesInstructionsWidgetsCoordinator = SessionNotesInstructionsWidgetsCoordinatorBase
    with _$SessionNotesInstructionsWidgetsCoordinator;

abstract class SessionNotesInstructionsWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  SessionNotesInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.smartText,
    required this.touchRipple,
    required this.wifiDisconnectOverlay,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @action
  constructor() {
    cooldownStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    smartText
        .setMessagesData(SessionLists.getNotesInstructions(isHybrid: false));
    smartText.startRotatingText();
    disposers.add(rippleCompletionStatusReactor());
  }

  @action
  onTap(Offset tapPosition) async {
    if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
      return;
    } else {
      cooldownStopwatch.reset();
    }
    touchRipple.onTap(tapPosition);
    if (hasTappedOnTheBottomHalf) {
      if (smartText.currentIndex.isLessThan(2)) {
        smartText.startRotatingText(isResuming: true);
        if (smartText.currentIndex == 1) {
          smartText.setWidgetVisibility(false);
          beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToSky);
          beachWaves.currentStore.reverseMovie(NoParams());
        }
      }
    }
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished && smartText.currentIndex == 2) {
          Modular.to.navigate(SessionConstants.showGroupGeometry);
        }
      });

  @computed
  bool get hasTappedOnTheBottomHalf =>
      touchRipple.tapPlacement == GesturePlacement.bottomHalf;

  @computed
  bool get textIsDoneFadingInOrOut =>
      smartText.isDoneAnimating || smartText.currentIndex == 0;
}
