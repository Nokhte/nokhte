// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
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
    beachWavesMovieStatusReactor();
  }

  @action
  invisiblizePrimarySmartText() => primarySmartText.setWidgetVisibility(false);

  @observable
  bool isFirstTap = true;

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @action
  onTap(
    Offset tapPosition, {
    required Function onFinalTap,
  }) async {
    touchRipple.onTap(tapPosition);
    if (isFirstTap) {
      cooldownStopwatch.start();
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.startRotatingText(isResuming: true);
      isFirstTap = false;
    } else if (!isFirstTap &&
        cooldownStopwatch.elapsedMilliseconds.isGreaterThan(950)) {
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.startRotatingText(isResuming: true);
      cooldownStopwatch.stop();
      await onFinalTap();
    }
  }

  @action
  initTransitionToSpeaking() {
    beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
    beachWaves.currentStore.initMovie(NoParams());
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

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate(SessionConstants.speaking);
        }
      });
}
