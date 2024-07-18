import 'dart:async';
import 'dart:ui';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

mixin TouchRippleUtils {
  TouchRippleStore get touchRipple;
  BeachWavesStore get beachWaves;

  onReadyToNavigate(
    String route, {
    Map args = const {},
  }) {
    Timer.periodic(Seconds.get(0, milli: 500), (timer) {
      if (touchRipple.movieStatus == MovieStatus.finished ||
          touchRipple.movieStatus == MovieStatus.idle) {
        Modular.to.navigate(route, arguments: args.isNotEmpty ? args : null);
        timer.cancel();
      }
    });
  }

  initWaterWake(Offset offset) {
    if (beachWaves.movieStatus != MovieStatus.finished ||
        beachWaves.movieMode == BeachWaveMovieModes.onShore ||
        beachWaves.movieMode == BeachWaveMovieModes.resumeOnShore) {
      touchRipple.onSwipe(offset);
    }
  }
}
