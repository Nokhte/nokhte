// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_widgets_coordinator.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'needs_update_widgets_coordinator.g.dart';

class NeedsUpdateWidgetsCoordinator = _NeedsUpdateWidgetsCoordinatorBase
    with _$NeedsUpdateWidgetsCoordinator;

abstract class _NeedsUpdateWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final GestureCrossStore gestureCross;
  final BeachWavesStore beachWaves;
  final TintStore tint;
  final NokhteGradientTextStore gradientText;

  _NeedsUpdateWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.tint,
    required this.beachWaves,
    required this.gestureCross,
    required this.gradientText,
  });

  @observable
  ResumeOnShoreParams params = ResumeOnShoreParams.initial();

  @action
  constructor() {
    if (Modular.args.data["resumeOnShoreParams"] != null) {
      params = Modular.args.data["resumeOnShoreParams"];
    }
    gestureCross.fadeInTheCross();
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(Modular.args.data["resumeOnShoreParams"]);
    beachWavesMovieStatusReactor();
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
