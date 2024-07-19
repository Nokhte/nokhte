// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'socratic_notes_instructions_widgets_coordinator.g.dart';

class SocraticNotesInstructionsWidgetsCoordinator = SocraticNotesInstructionsWidgetsCoordinatorBase
    with _$SocraticNotesInstructionsWidgetsCoordinator;

abstract class SocraticNotesInstructionsWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TouchRippleStore touchRipple;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  SocraticNotesInstructionsWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.smartText,
    required this.touchRipple,
    required this.wifiDisconnectOverlay,
  }) {
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    smartText.setMessagesData(SessionLists.socraticNotesInstructions);
    smartText.startRotatingText();
    disposers.add(rippleCompletionStatusReactor());
  }

  @action
  onTap(Offset tapPosition) async {
    if (smartText.currentIndex == 0) {
      touchRipple.onTap(tapPosition);
      smartText.startRotatingText(isResuming: true);
      beachWaves.setMovieMode(BeachWaveMovieModes.deepSeaToSky);
      beachWaves.currentStore.reverseMovie(NoParams());
    }
  }

  rippleCompletionStatusReactor() =>
      reaction((p0) => touchRipple.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionConstants.showGroupGeometry);
        }
      });
}
