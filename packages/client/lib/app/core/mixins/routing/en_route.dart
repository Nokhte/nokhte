import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/home.dart';

mixin EnRouteRouter on EnRoute {
  getModularArgs(ResumeOnShoreParams params) => {
        HomeConstants.RESUME_ON_SHORE_PARAMS: params,
      };
}

mixin EnRoute {
  final _params = Observable(const ResumeOnShoreParams());

  ResumeOnShoreParams get params => _params.value;

  _setParams(ResumeOnShoreParams params) => _params.value = params;

  Action actionSetParams = Action(() {});

  initEnRouteActions() {
    actionSetParams = Action(_setParams);
  }

  setParams(ResumeOnShoreParams params) => actionSetParams([params]);

  bool get hasReceivedRoutingArgs => Modular.args.data.toString() != 'null';
}

mixin EnRouteConsumer on EnRoute {
  BeachWavesStore get beachWaves;

  consumeRoutingArgs() {
    if (hasReceivedRoutingArgs) {
      setParams(Modular.args.data[HomeConstants.RESUME_ON_SHORE_PARAMS]);
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(params);
  }
}
