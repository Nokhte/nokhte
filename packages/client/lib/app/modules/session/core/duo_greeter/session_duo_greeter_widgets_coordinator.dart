// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_duo_greeter_widgets_coordinator.g.dart';

class SessionDuoGreeterWidgetsCoordinator = _SessionDuoGreeterWidgetsCoordinatorBase
    with _$SessionDuoGreeterWidgetsCoordinator;

abstract class _SessionDuoGreeterWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final TouchRippleStore touchRipple;

  _SessionDuoGreeterWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.touchRipple,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToDrySand);
    primarySmartText.setMessagesData(SessionLists.duoGreeterPrimary);
    secondarySmartText.setMessagesData(SessionLists.duoGreeterSecondary);
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
  }

  @action
  hidePrimarySmartText() => primarySmartText.setWidgetVisibility(false);

  @observable
  bool isFirstTap = true;

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @action
  onTap(
    Offset tapPosition, {
    required Function onFinalTap,
  }) async {
    if (isFirstTap) {
      touchRipple.onTap(tapPosition);
      cooldownStopwatch.start();
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.startRotatingText(isResuming: true);
      isFirstTap = false;
    } else if (!isFirstTap &&
        cooldownStopwatch.elapsedMilliseconds.isGreaterThan(950)) {
      touchRipple.onTap(tapPosition);
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.startRotatingText(isResuming: true);
      cooldownStopwatch.reset();
      cooldownStopwatch.stop();
      await onFinalTap();
    }
  }

  @action
  onTenSecondLapse() {
    primarySmartText.startRotatingText(isResuming: true);
  }

  @action
  onCollaboratorLeft() {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    primarySmartText.setWidgetVisibility(primarySmartText.pastShowWidget);
    secondarySmartText.setWidgetVisibility(secondarySmartText.pastShowWidget);
  }
}
