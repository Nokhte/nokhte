// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/in_app_purchase/in_app_purchase.dart';
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
  final MultiplyingNokhteStore multiplyingNokhte;
  _SessionPaywallWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.touchRipple,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.gestureCross,
    required this.tertiarySmartText,
    required this.multiplyingNokhte,
  });

  @observable
  int tapCount = 0;

  @observable
  bool canSwipe = false;

  @observable
  bool disableTouchInput = false;

  @observable
  bool productInfoIsReceived = false;

  @observable
  Stopwatch cooldownStopwatch = Stopwatch();

  @observable
  bool isExiting = false;

  @action
  setDisableTouchInput(bool newValue) => disableTouchInput = newValue;

  @action
  constructor() {
    cooldownStopwatch.start();
    beachWaves.setMovieMode(BeachWaveMovieModes.borealisToSky);
    primarySmartText.setMessagesData(SharedLists.empty);
    secondarySmartText.setMessagesData(SessionLists.swipeUpToPay);
    tertiarySmartText.setMessagesData(SessionLists.swipeToDecide);
    setSmartTextBottomPaddingScalar(.1);
    multiplyNokhteReactor();
    setCanSwipe(false);
  }

  @action
  setCanSwipe(bool newVal) => canSwipe = newVal;

  @action
  onProductInfoReceived(SkuProductEntity product) {
    primarySmartText.setMessagesData(
      SessionLists.paywallPrimaryList(
        currencyCode: NumberFormat.simpleCurrency(
                name: product.currencyCode, locale: Platform.localeName)
            .currencySymbol,
        price: product.price,
        period: product.period,
      ),
    );
    primarySmartText.startRotatingText();
    productInfoIsReceived = true;
    productInfoIsReceived = true;
    multiplyingNokhte.initMovie(
      const MultiplyingNokhteMovieParams(
        movieMode: MultiplyingNokhteMovieModes.showSingleNokhte,
      ),
    );
  }

  onTap(
    Offset tapPosition, {
    required Function onFinalTap,
  }) async {
    if (!disableTouchInput) {
      if (multiplyingNokhte.movieStatus == MovieStatus.finished) {
        if (tapCount.isLessThan(3)) {
          if (tapCount == 0) {
            multiplyingNokhte.initMovie(
              const MultiplyingNokhteMovieParams(
                movieMode: MultiplyingNokhteMovieModes.singleToPair,
                reverse: true,
              ),
            );
          } else if (tapCount == 1) {
            multiplyingNokhte.initMovie(
              const MultiplyingNokhteMovieParams(
                movieMode: MultiplyingNokhteMovieModes.singleToTrio,
                reverse: true,
              ),
            );
          } else if (tapCount == 2) {
            multiplyingNokhte.initMovie(
              const MultiplyingNokhteMovieParams(
                movieMode: MultiplyingNokhteMovieModes.singleToQuintuplet,
                reverse: true,
              ),
            );
            await onFinalTap();
          }
          primarySmartText.startRotatingText(isResuming: true);
          touchRipple.onTap(tapPosition);
          tapCount++;
        }
      }
    }
  }

  multiplyNokhteReactor() =>
      reaction((p0) => multiplyingNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (multiplyingNokhte.movieMode ==
              MultiplyingNokhteMovieModes.showSingleNokhte) {
            multiplyingNokhte.initMovie(
              const MultiplyingNokhteMovieParams(
                movieMode: MultiplyingNokhteMovieModes.singleToPair,
              ),
            );
          } else if (multiplyingNokhte.movieMode ==
                  MultiplyingNokhteMovieModes.singleToPair &&
              tapCount == 1) {
            multiplyingNokhte.initMovie(
              const MultiplyingNokhteMovieParams(
                movieMode: MultiplyingNokhteMovieModes.singleToTrio,
              ),
            );
          } else if (multiplyingNokhte.movieMode ==
                  MultiplyingNokhteMovieModes.singleToTrio &&
              tapCount == 2) {
            multiplyingNokhte.initMovie(
              const MultiplyingNokhteMovieParams(
                movieMode: MultiplyingNokhteMovieModes.singleToQuintuplet,
              ),
            );
          } else if (multiplyingNokhte.movieMode ==
                  MultiplyingNokhteMovieModes.singleToQuintuplet &&
              tapCount == 3) {
            multiplyingNokhte.initMovie(
              const MultiplyingNokhteMovieParams(
                movieMode: MultiplyingNokhteMovieModes.singleToCrossroad,
              ),
            );
            multiplyingNokhte.setSymbols(["", "\$", "X", ""]);
            tertiarySmartText.startRotatingText();
          } else if (multiplyingNokhte.movieMode ==
              MultiplyingNokhteMovieModes.chooseCancel) {
            gestureCross.fadeInTheCross();
            tertiarySmartText.setWidgetVisibility(false);
            beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
            beachWaves.currentStore.initMovie(
              const AnyToOnShoreParams(
                startingColors: WaterColorsAndStops.borealis,
              ),
            );
          }
        }
      });

  @action
  onSwipeUp(Function onSwipeUp) async {
    if (tapCount == 3 &&
        canSwipe &&
        multiplyingNokhte.movieStatus == MovieStatus.finished) {
      canSwipe = false;
      tertiarySmartText.setWidgetVisibility(false);
      multiplyingNokhte.initMovie(
        const MultiplyingNokhteMovieParams(
          movieMode: MultiplyingNokhteMovieModes.chooseMonetization,
        ),
      );
      await onSwipeUp();
    }
  }

  @action
  onSwipeDown(Function onSwipeDown) async {
    if (tapCount == 3 &&
        multiplyingNokhte.movieStatus == MovieStatus.finished &&
        canSwipe) {
      await onSwipeDown();
      isExiting = true;
      multiplyingNokhte.initMovie(
        const MultiplyingNokhteMovieParams(
          movieMode: MultiplyingNokhteMovieModes.chooseCancel,
        ),
      );
      canSwipe = false;
    }
  }

  onPaymentFailure() {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (multiplyingNokhte.movieStatus == MovieStatus.finished && !canSwipe) {
        multiplyingNokhte.initMovie(
          const MultiplyingNokhteMovieParams(
            movieMode: MultiplyingNokhteMovieModes.chooseMonetization,
            reverse: true,
          ),
        );
        Timer(Seconds.get(2), () {
          canSwipe = true;
        });
        tertiarySmartText.setWidgetVisibility(true);
        timer.cancel();
      }
    });
  }

  @action
  onExit() {
    if (!isExiting) {
      multiplyingNokhte.initMovie(
        const MultiplyingNokhteMovieParams(
          movieMode: MultiplyingNokhteMovieModes.chooseCancel,
        ),
      );
      canSwipe = false;
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
