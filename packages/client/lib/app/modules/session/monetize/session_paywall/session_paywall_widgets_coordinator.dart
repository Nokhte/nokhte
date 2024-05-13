// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
part 'session_paywall_widgets_coordinator.g.dart';

class SessionPaywallWidgetsCoordinator = _SessionPaywallWidgetsCoordinatorBase
    with _$SessionPaywallWidgetsCoordinator;

abstract class _SessionPaywallWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final SmartTextStore tertiarySmartText;
  final BeachWavesStore beachWaves;
  final TouchRippleStore touchRipple;
  final GestureCrossStore gestureCross;
  _SessionPaywallWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.gestureCross,
    required this.tertiarySmartText,
  });

  @observable
  int tapCount = 0;

  @observable
  bool hasSwiped = false;

  @observable
  bool disableTouchInput = false;

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @action
  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  @action
  constructor() {
    cooldownStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.borealisToSky);
    primarySmartText.setMessagesData(SessionLists.paywallPrimaryList);
    secondarySmartText.setMessagesData(SessionLists.swipeUpToPay);
    tertiarySmartText.setMessagesData(SessionLists.swipeDownToExit);
    primarySmartText.startRotatingText();
    setSmartTextBottomPaddingScalar(.15);
  }

  onTap(Offset tapPosition) {
    if (!disableTouchInput) {
      if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950) &&
          tapCount != 0) {
        return;
      } else {
        cooldownStopwatch.reset();
      }
      if (tapCount.isLessThan(2)) {
        primarySmartText.startRotatingText(isResuming: true);
        touchRipple.onTap(tapPosition);
        tapCount++;
        if (tapCount == 2) {
          Timer(Seconds.get(0, milli: 500), () {
            setSmartTextBottomPaddingScalar(0);
          });
          secondarySmartText.startRotatingText();
          tertiarySmartText.startRotatingText();
          //
        }
      }
    }
  }

  onSwipeUp() {
    if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
      return;
    }
    if (tapCount == 2 && !hasSwiped) {
      hasSwiped = true;
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.setWidgetVisibility(false);
      tertiarySmartText.setWidgetVisibility(false);
    }
  }

  onPaymentFailure() {
    hasSwiped = false;
    primarySmartText.setWidgetVisibility(false);
    Timer(Seconds.get(0, milli: 500), () {
      primarySmartText.setCurrentIndex(2);
      primarySmartText.setWidgetVisibility(true);
    });
    secondarySmartText.setWidgetVisibility(true);
    tertiarySmartText.setWidgetVisibility(true);
  }

  onSwipeDown() {
    if (cooldownStopwatch.elapsedMilliseconds.isLessThan(950)) {
      return;
    }
    if (tapCount == 2 && !hasSwiped) {
      hasSwiped = true;
      gestureCross.fadeInTheCross();
      primarySmartText.startRotatingText(isResuming: true);
      secondarySmartText.setWidgetVisibility(false);
      tertiarySmartText.setWidgetVisibility(false);
      beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
      beachWaves.currentStore.initMovie(
        const AnyToOnShoreParams(
          startingColors: WaterColorsAndStops.borealis,
        ),
      );
    }
  }

  beachWaveMovieStatusReactor({
    required Function onReturnHome,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            onReturnHome();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.borealisToSky) {
            Modular.to.navigate(SessionConstants.groupGreeter);
          }
        }
      });
}
