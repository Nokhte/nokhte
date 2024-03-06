// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'irl_nokhte_session_phase0_widgets_coordinator.g.dart';

class IrlNokhteSessionPhase0WidgetsCoordinator = _IrlNokhteSessionPhase0WidgetsCoordinatorBase
    with _$IrlNokhteSessionPhase0WidgetsCoordinator;

abstract class _IrlNokhteSessionPhase0WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final TouchRippleStore rippleTouch;

  _IrlNokhteSessionPhase0WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.rippleTouch,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(
      BeachWaveMovieModes.vibrantBlueGradientToTimesUp,
    );
    primarySmartText.setMessagesData(
      MessagesData.irlNokhteSessionPhase0PrimaryList,
    );
    secondarySmartText.setMessagesData(
      MessagesData.irlNokhteSessionPhase0SecondaryList,
    );
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
  }

  @action
  invisiblizePrimarySmartText() => primarySmartText.setWidgetVisibility(false);

  @action
  onTap(Offset tapPosition) {
    rippleTouch.onTap(tapPosition);
    primarySmartText.startRotatingText(isResuming: true);
    secondarySmartText.setWidgetVisibility(false);
  }

  @action
  onTenSecondLapse() {
    primarySmartText.startRotatingText(isResuming: true);
  }
}
