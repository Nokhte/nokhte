import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte/app/modules/storage/storage.dart';

mixin HomeScreenWidgetsUtils on Reactions, EnRoute, EnRouteConsumer {
  TouchRippleStore get touchRipple;
  initHomeUtils() {
    initHomeWidgetActions();
    initEnRouteActions();
    consumeRoutingArgs();
    disposers.add(beachWavesMovieStatusReactor());
  }

  beachWavesMovieStatusReactor() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Timer.periodic(Seconds.get(0, milli: 500), (timer) {
            if (touchRipple.movieStatus == MovieStatus.finished) {
              timer.cancel();
              if (beachWaves.movieMode ==
                  BeachWaveMovieModes.onShoreToOceanDive) {
                Modular.to
                    .navigate(SessionStarterConstants.sessionStarterEntry);
              } else if (beachWaves.movieMode ==
                  BeachWaveMovieModes.onShoreToSky) {
                Modular.to.navigate(StorageConstants.root);
              } else if (beachWaves.movieMode ==
                  BeachWaveMovieModes.resumeOnShore) {
                beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
                beachWaves.currentStore.initMovie(params.direction);
              }
            }
            //
          });
        }
      });

  final _swipeDirection = Observable(GestureDirections.initial);
  final _hasInitiatedBlur = Observable(false);
  final _isDisconnected = Observable(false);
  final _touchIsDisabled = Observable(false);

  hasSwiped() => _swipeDirection.value != GestureDirections.initial;

  GestureDirections get swipeDirection => _swipeDirection.value;
  bool get hasInitiatedBlur => _hasInitiatedBlur.value;
  bool get isDisconnected => _isDisconnected.value;
  bool get touchIsDisabled => _touchIsDisabled.value;

  _setSwipeDirection(GestureDirections value) => _swipeDirection.value = value;
  _setHasInitiatedBlur(bool value) => _hasInitiatedBlur.value = value;
  _setIsDisconnected(bool value) => _isDisconnected.value = value;
  _setTouchIsDisabled(bool value) => _touchIsDisabled.value = value;

  Action actionSetSwipeDirection = Action(() {});
  Action actionSetHasInitiatedBlur = Action(() {});
  Action actionSetIsDisconnected = Action(() {});
  Action actionSetTouchIsDisabled = Action(() {});

  initHomeWidgetActions() {
    actionSetSwipeDirection = Action(_setSwipeDirection);
    actionSetHasInitiatedBlur = Action(_setHasInitiatedBlur);
    actionSetIsDisconnected = Action(_setIsDisconnected);
    actionSetTouchIsDisabled = Action(_setTouchIsDisabled);
  }

  setTouchIsDisabled(bool value) {
    actionSetTouchIsDisabled([value]);
  }

  setIsDisconnected(bool value) {
    actionSetIsDisconnected([value]);
  }

  setHasInitiatedBlur(bool value) {
    actionSetHasInitiatedBlur([value]);
  }

  setSwipeDirection(GestureDirections value) {
    actionSetSwipeDirection([value]);
  }
}
