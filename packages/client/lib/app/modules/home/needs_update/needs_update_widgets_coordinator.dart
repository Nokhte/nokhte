// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/connectivity/connectivity.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'needs_update_widgets_coordinator.g.dart';

class NeedsUpdateWidgetsCoordinator = _NeedsUpdateWidgetsCoordinatorBase
    with _$NeedsUpdateWidgetsCoordinator;

abstract class _NeedsUpdateWidgetsCoordinatorBase
    with Store, EnRoute, EnRouteConsumer, Reactions, BaseWidgetsCoordinator {
  final GestureCrossStore gestureCross;
  final TintStore tint;
  final NokhteGradientTextStore gradientText;
  final BeachWavesStore beachWaves;
  @override
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;

  _NeedsUpdateWidgetsCoordinatorBase({
    required this.gestureCross,
    required this.beachWaves,
    required this.tint,
    required this.gradientText,
    required this.wifiDisconnectOverlay,
  }) {
    initEnRouteActions();
    initBaseWidgetsCoordinatorActions();
  }

  @action
  constructor() {
    consumeRoutingArgs();
    gestureCross.fadeInTheCross();
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(params);
    disposers.add(beachWavesMovieStatusReactor());
    tint.initMovie(NoParams());
    gradientText.setWidgetVisibility(false);
    Timer(Seconds.get(1), () {
      gradientText.setWidgetVisibility(true);
    });
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.resumeOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
          }
        }
      });
}
