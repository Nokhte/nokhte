// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'session_group_greeter_widgets_coordinator.g.dart';

class SessionGroupGreeterWidgetsCoordinator = _SessionGroupGreeterWidgetsCoordinatorBase
    with _$SessionGroupGreeterWidgetsCoordinator;

abstract class _SessionGroupGreeterWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final TouchRippleStore touchRipple;
  final SessionSeatingGuideStore sessionSeatingGuide;
  final TintStore tint;
  final SessionPhonePlacementGuideStore sessionPhonePlacementGuide;

  _SessionGroupGreeterWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.sessionPhonePlacementGuide,
    required this.secondarySmartText,
    required this.touchRipple,
    required this.sessionSeatingGuide,
    required this.tint,
  });

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
    required Function onFinalTap,
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
          setSmartTextBottomPaddingScalar(0.1);
        });
        primarySmartText.startRotatingText(isResuming: true);
        secondarySmartText.startRotatingText(isResuming: true);
        sessionSeatingGuide.setWidgetVisibility(false);
        sessionPhonePlacementGuide.setWidgetVisibility(true);
        tapCount++;
      } else if (tapCount == 2) {
        Timer(Seconds.get(0, milli: 500), () {
          setSmartTextBottomPaddingScalar(.3);
        });
        sessionPhonePlacementGuide.setWidgetVisibility(false);
        touchRipple.onTap(tapPosition);
        primarySmartText.startRotatingText(isResuming: true);
        secondarySmartText.startRotatingText(isResuming: true);
        cooldownStopwatch.stop();
        tapCount++;
        await onFinalTap();
      }
    }
  }

  @action
  onCollaboratorLeft() {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    tint.setWidgetVisibility(false);
    sessionSeatingGuide.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    primarySmartText.setWidgetVisibility(primarySmartText.pastShowWidget);
    secondarySmartText.setWidgetVisibility(secondarySmartText.pastShowWidget);
    tint.setWidgetVisibility(tint.pastShowWidget);
    sessionSeatingGuide.setWidgetVisibility(sessionSeatingGuide.pastShowWidget);
  }

  @action
  initTransition(String route) {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) {
      if (hasTriggeredTint) {
        hasStartedNavigation = false;
        tint.setControl(Control.playReverse);
        primarySmartText.setWidgetVisibility(false);
        Timer(Seconds.get(2), () {
          Modular.to.navigate(route);
        });
        timer.cancel();
      }
    });
  }

  primarySmartTextIndexReactor({
    required Function onComplete,
  }) =>
      reaction((p0) => primarySmartText.currentIndex, (p0) async {
        if (p0 == 3) {
          await onComplete();
          if (!isTheLastOneToFinish) {
            Timer(Seconds.get(0, milli: 500), () {
              primarySmartText.startRotatingText(isResuming: true);
            });
            tint.setControl(Control.play);
            hasTriggeredTint = true;
          }
        }
      });
}
