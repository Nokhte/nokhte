import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session/session.dart';
export './choose_greeter_type.dart';
export './session_router.dart';

mixin SessionRouter {
  BeachWavesStore get beachWaves;
  initTransition({
    required SessionScreenTypes phoneType,
    required Function onTransition,
  }) {
    if (phoneType == SessionScreenTypes.speaking) {
      beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    } else if (phoneType == SessionScreenTypes.notes) {
      Timer(Seconds.get(1), () {
        Modular.to.navigate(SessionConstants.notes);
      });
    } else if (phoneType == SessionScreenTypes.groupHybrid ||
        phoneType == SessionScreenTypes.soloHybrid) {
      beachWaves.setMovieMode(BeachWaveMovieModes.skyToInvertedHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    }
    onTransition();
  }

  beachWavesMovieStatusReactor({
    required bool isACollaborativeSession,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode ==
              BeachWaveMovieModes.skyToInvertedHalfAndHalf) {
            if (isACollaborativeSession) {
              Modular.to.navigate(SessionConstants.soloHybrid);
            }
          }
        }
      });
}
