// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/timer/presentation/mobx/mobx.dart';
import 'package:nokhte/app/core/types/seconds.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'base_times_up_store.g.dart';

class BaseTimesUpStore = _BaseTimesUpStoreBase with _$BaseTimesUpStore;

abstract class _BaseTimesUpStoreBase extends Equatable with Store {
  final TimerCoordinator timer;
  final BeachWavesTrackerStore beachWaves;
  final Duration productionTimerLength;

  _BaseTimesUpStoreBase({
    required this.timer,
    required this.beachWaves,
    required this.productionTimerLength,
  });

  @observable
  bool isFirstTimeStartingMovie = true;

  @action
  initOrPauseTimesUp(bool shouldRun) {
    if (shouldRun) {
      if (isFirstTimeStartingMovie) {
        final Duration timerLength =
            kDebugMode ? Seconds.get(20) : productionTimerLength;
        beachWaves.initiateTimesUp(timerLength: timerLength);
        isFirstTimeStartingMovie = false;
      } else {
        beachWaves.setControl(Control.play);
      }
    } else {
      beachWaves.setControl(Control.stop);
    }
  }

  @override
  List<Object> get props => [
// some items
      ];
}
