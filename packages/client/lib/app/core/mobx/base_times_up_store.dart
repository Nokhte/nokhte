// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'base_times_up_store.g.dart';

class BaseTimesUpStore = _BaseTimesUpStoreBase with _$BaseTimesUpStore;

abstract class _BaseTimesUpStoreBase extends BaseCoordinator with Store {
  final Duration productionTimerLength;
  final BeachWavesStore newBeachWaves;

  _BaseTimesUpStoreBase({
    required this.newBeachWaves,
    required this.productionTimerLength,
    required super.captureScreen,
  });

  @observable
  bool isFirstTimeStartingMovie = true;

  preventOnShoreSeizure() =>
      newBeachWaves.setMovieMode(BeachWaveMovieModes.staticDepths);

  @action
  initOrPauseTimesUp(bool shouldRun) {
    if (newBeachWaves.movieMode == BeachWaveMovieModes.timesUp) {
      if (shouldRun) {
        if (isFirstTimeStartingMovie) {
          final Duration timerLength =
              kDebugMode ? Seconds.get(10) : productionTimerLength;
          newBeachWaves.currentStore.initMovie(timerLength);
          isFirstTimeStartingMovie = false;
        } else {
          newBeachWaves.currentStore.control = Control.play;
        }
      } else {
        newBeachWaves.currentStore.control = Control.stop;
      }
    }
  }
}
