// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
part 'waiting_patron_widgets_coordinator.g.dart';

class WaitingPatronWidgetsCoordinator = _WaitingPatronWidgetsCoordinatorBase
    with _$WaitingPatronWidgetsCoordinator;

abstract class _WaitingPatronWidgetsCoordinatorBase
    with Store, BaseWidgetsCoordinator, SmartTextPaddingAdjuster {
  final BeachWavesStore beachWaves;
  final TintStore tint;
  final GestureCrossStore gestureCross;
  final NokhteGradientTextStore nokhteGradientText;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _WaitingPatronWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.nokhteGradientText,
    required this.wifiDisconnectOverlay,
    required this.tint,
    required this.gestureCross,
  });

  @observable
  bool isNavigatingAway = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.borealisToSky);
    tint.setControl(Control.play);
    setSmartTextBottomPaddingScalar(.15);
    nokhteGradientText.setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      if (!isNavigatingAway) {
        nokhteGradientText.setWidgetVisibility(true);
      }
    });
  }

  onSessionUnlocked() {
    isNavigatingAway = true;
    beachWaves.currentStore.initMovie(NoParams());
    tint.reverseMovie(NoParams());
    nokhteGradientText.setWidgetVisibility(false);
  }

  @action
  onExit() {
    gestureCross.fadeInTheCross();
    tint.reverseMovie(NoParams());
    nokhteGradientText.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
    beachWaves.currentStore.initMovie(
      const AnyToOnShoreParams(
        startingColors: WaterColorsAndStops.borealis,
      ),
    );
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
