// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
part 'session_group_greeter_widgets_coordinator.g.dart';

class SessionGroupGreeterWidgetsCoordinator = _SessionGroupGreeterWidgetsCoordinatorBase
    with _$SessionGroupGreeterWidgetsCoordinator;

abstract class _SessionGroupGreeterWidgetsCoordinatorBase
    with
        Store,
        SessionRouter,
        SmartTextPaddingAdjuster,
        BaseWidgetsCoordinator {
  @override
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final TouchRippleStore touchRipple;
  final SessionSeatingGuideStore sessionSeatingGuide;
  final SessionPhonePlacementGuideStore sessionPhonePlacementGuide;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _SessionGroupGreeterWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.sessionPhonePlacementGuide,
    required this.secondarySmartText,
    required this.touchRipple,
    required this.sessionSeatingGuide,
  }) {
    initBaseWidgetsCoordinatorActions();
    initSmartTextActions();
  }

  @action
  constructor({
    required int numberOfCollaborators,
    required int userIndex,
  }) {
    sessionPhonePlacementGuide.setWidgetVisibility(false);
    sessionSeatingGuide.setWidgetVisibility(false);
    beachWaves.setMovieMode(
      BeachWaveMovieModes.skyToDrySand,
    );
    primarySmartText.setMessagesData(
      SessionLists.getGroupGreeterPrimary(
        numberOfCollaborators: numberOfCollaborators,
        userIndex: userIndex,
      ),
    );
    setSmartTextBottomPaddingScalar(.3);
    setSmartTextTopPaddingScalar(0);
    sessionPhonePlacementGuide.setValues(
      AdjacentNumbers.getAdjacentNumbers(
        numberOfCollaborators,
        userIndex + 1,
      ),
    );
    sessionSeatingGuide.setValues(
      AdjacentNumbers.getAdjacentNumbers(
        numberOfCollaborators,
        userIndex + 1,
      ),
    );
    secondarySmartText.setMessagesData(SessionLists.groupGreeterSecondary);
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
  }

  @observable
  int tapCount = 0;

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool isTheLastOneToFinish = false;

  @observable
  bool hasStartedNavigation = false;

  @observable
  bool hasTriggeredTint = false;

  @action
  setIsTheLastOneToFinish(bool val) => isTheLastOneToFinish = val;

  @action
  invisiblizePrimarySmartText() => primarySmartText.setWidgetVisibility(false);

  @action
  onTap(
    Offset tapPosition, {
    required SessionScreenTypes phoneType,
  }) async {
    if (tapCount == 0) {
      touchRipple.onTap(tapPosition);
      sessionSeatingGuide.setWidgetVisibility(true);
      cooldownStopwatch.start();
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.startRotatingText(isResuming: true);
      tapCount++;
    } else if (cooldownStopwatch.elapsedMilliseconds.isGreaterThan(950)) {
      if (tapCount == 1) {
        cooldownStopwatch.reset();
        touchRipple.onTap(tapPosition);
        Timer(Seconds.get(0, milli: 500), () {
          setSmartTextBottomPaddingScalar(0.06);
        });
        primarySmartText.startRotatingText(isResuming: true);
        secondarySmartText.startRotatingText(isResuming: true);
        sessionSeatingGuide.setWidgetVisibility(false);
        sessionPhonePlacementGuide.setWidgetVisibility(true);
        tapCount++;
      } else if (tapCount == 2) {
        Timer(Seconds.get(0, milli: 500), () {
          setSmartTextBottomPaddingScalar(.27);
        });
        sessionPhonePlacementGuide.setWidgetVisibility(false);
        touchRipple.onTap(tapPosition);
        primarySmartText.startRotatingText(isResuming: true);
        secondarySmartText.startRotatingText(isResuming: true);
        cooldownStopwatch.stop();
        tapCount++;
        initTransition(phoneType);
      }
    }
  }

  @action
  onCollaboratorLeft() {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    sessionSeatingGuide.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    primarySmartText.setWidgetVisibility(primarySmartText.pastShowWidget);
    secondarySmartText.setWidgetVisibility(secondarySmartText.pastShowWidget);
    sessionSeatingGuide.setWidgetVisibility(sessionSeatingGuide.pastShowWidget);
  }

  @computed
  bool get hasCompletedInstructions => tapCount == 3;
}
