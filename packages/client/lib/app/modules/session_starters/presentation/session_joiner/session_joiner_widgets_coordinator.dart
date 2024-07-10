// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_joiner_widgets_coordinator.g.dart';

class SessionJoinerWidgetsCoordinator = _SessionJoinerWidgetsCoordinatorBase
    with _$SessionJoinerWidgetsCoordinator;

abstract class _SessionJoinerWidgetsCoordinatorBase
    with Store, SmartTextPaddingAdjuster, BaseWidgetsCoordinator, Reactions {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartText;
  final TintStore tint;
  final GestureCrossStore gestureCross;
  final CenterInstructionalNokhteStore centerInstructionalNokhte;
  final InstructionalGradientNokhteStore sessionStarterInstructionalNokhte;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionJoinerWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.tint,
    required this.gestureCross,
    required this.smartText,
    required this.wifiDisconnectOverlay,
    required this.centerInstructionalNokhte,
    required this.sessionStarterInstructionalNokhte,
  }) {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
    setSmartTextTopPaddingScalar(0);
    setSmartTextBottomPaddingScalar(.27);
    setSmartTextSubMessagePaddingScalar(110);
  }

  @action
  constructor(Offset centerParam) {
    setCenter(centerParam);
    gestureCross.cross.initStaticGlow();
    gestureCross.fadeIn(onFadeIn: Left(() {
      gestureCross.strokeCrossNokhte.setWidgetVisibility(false);
    }));
    tint.initMovie(NoParams());
    smartText.setMessagesData(SessionStartersList.sessionJoinerInstructions);
    beachWaves.setMovieMode(BeachWaveMovieModes.emptyTheOcean);
    beachWaves.currentStore.initMovie(-500.0);
  }
}
