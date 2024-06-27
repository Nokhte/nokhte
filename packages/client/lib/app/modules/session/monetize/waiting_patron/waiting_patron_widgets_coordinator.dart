// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'waiting_patron_widgets_coordinator.g.dart';

class WaitingPatronWidgetsCoordinator = _WaitingPatronWidgetsCoordinatorBase
    with _$WaitingPatronWidgetsCoordinator;

abstract class _WaitingPatronWidgetsCoordinatorBase with Store {
  final BeachWavesStore beachWaves;
  final TintStore tint;
  final GestureCrossStore gestureCross;
  final NokhteGradientTextStore nokhteGradientText;

  final BaseWidgetsCoordinator base;
  _WaitingPatronWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.nokhteGradientText,
    required WifiDisconnectOverlayStore wifiDisconnectOverlay,
    required this.tint,
    required this.gestureCross,
  }) : base = BaseWidgetsCoordinator(
            wifiDisconnectOverlay: wifiDisconnectOverlay);

  @observable
  bool isNavigatingAway = false;

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.borealisToSky);
    tint.setControl(Control.play);
    base.setSmartTextBottomPaddingScalar(.15);
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
    required Function onReturnToSession,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            onReturnHome();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.borealisToSky) {
            onReturnToSession();
          }
        }
      });
}
