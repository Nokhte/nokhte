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
  initTransition(SessionScreenTypes phoneType) {
    if (phoneType == SessionScreenTypes.speaking ||
        phoneType == SessionScreenTypes.soloHybrid) {
      beachWaves.setMovieMode(BeachWaveMovieModes.skyToHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    } else if (phoneType == SessionScreenTypes.notes) {
      Timer(Seconds.get(1), () {
        Modular.to.navigate(SessionConstants.notes);
      });
    } else if (phoneType == SessionScreenTypes.groupHybrid) {
      beachWaves.setMovieMode(BeachWaveMovieModes.skyToInvertedHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    }
  }

  route({
    required bool isACollaborativeSession,
  }) {
    if (beachWaves.movieMode == BeachWaveMovieModes.skyToHalfAndHalf) {
      if (isACollaborativeSession) {
        Modular.to.navigate(SessionConstants.soloHybrid);
      } else {
        print("no takers??");
        Modular.to.navigate(SessionConstants.speaking);
      }
    } else if (beachWaves.movieMode ==
        BeachWaveMovieModes.skyToInvertedHalfAndHalf) {
      Modular.to.navigate(SessionConstants.groupHybrid);
    }
  }

  beachWavesMovieStatusReactor({
    required bool isACollaborativeSession,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          route(isACollaborativeSession: isACollaborativeSession);
        }
      });
}
