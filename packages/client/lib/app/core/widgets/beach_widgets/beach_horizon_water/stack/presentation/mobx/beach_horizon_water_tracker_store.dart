// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../movies/movies.dart';
// * Mobx Codegen Inclusion
part 'beach_horizon_water_tracker_store.g.dart';

class BeachHorizonWaterTrackerStore = _BeachHorizonWaterTrackerStoreBase
    with _$BeachHorizonWaterTrackerStore;

abstract class _BeachHorizonWaterTrackerStoreBase extends Equatable with Store {
  @action
  selectTimeBasedMovie(DateTime date) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      // Branch 1: Time is between 9 PM and 5:59 AM
      movie = DuskHorizonWaters.movie;
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      movie = MorningHorizonWaters.movie;
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      movie = DayHorizonWaters.movie;
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      movie = EveningHorizonWaters.movie;
    }
  }
  //

  @observable
  MovieTween movie = EveningHorizonWaters.movie;

  @observable
  Control control = Control.play;

  @override
  List<Object> get props => [];
}
// the problem is the gradients aren't moving
// with it so you don't have that part of the
// perspectives
