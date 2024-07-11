import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

mixin HomeScreenWidgetsUtils on Reactions, EnRoute, EnRouteConsumer {
  initUtils() {
    initEnRouteActions();
    consumeRoutingArgs();
    disposers.add(beachWavesMovieStatusReactor());
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
            Modular.to.navigate(SessionStarterConstants.sessionStarterEntry);
          } else if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToSky) {
            Modular.to.navigate(StorageConstants.root);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.resumeOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
            beachWaves.currentStore.initMovie(params.direction);
          }
        }
      });
}
