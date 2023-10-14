// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/beach_widgets/beach_horizon_water/stack/movies/depths_to_horizon_waters.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/data/water_colors_and_stops.dart';
import 'package:simple_animations/simple_animations.dart';

// * Mobx Codegen Inclusion
part 'beach_horizon_water_tracker_store.g.dart';

class BeachHorizonWaterTrackerStore = _BeachHorizonWaterTrackerStoreBase
    with _$BeachHorizonWaterTrackerStore;

abstract class _BeachHorizonWaterTrackerStoreBase extends Equatable with Store {
  @observable
  bool isComplete = false;

  @action
  selectTimeBasedMovie(DateTime date) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      // Branch 1: Time is between 9 PM and 5:59 AM
      movie = DepthsToHorizonWaters.getMovie(
        WaterColorsAndStops.schedulingDuskWaterFullScreen,
        WaterColorsAndStops.schedulingDuskWaterHalfScreen,
      );
      control = Control.play;
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      movie = DepthsToHorizonWaters.getMovie(
        WaterColorsAndStops.schedulingMorningWaterFullScreen,
        WaterColorsAndStops.schedulingMorningWaterHalfScreen,
      );
      control = Control.play;
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      movie = DepthsToHorizonWaters.getMovie(
        WaterColorsAndStops.schedulingDayWaterFullScreen,
        WaterColorsAndStops.schedulingDayWaterHalfScreen,
      );
      control = Control.play;
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      movie = DepthsToHorizonWaters.getMovie(
        WaterColorsAndStops.schedulingEveningWaterFullScreen,
        WaterColorsAndStops.schedulingEveningWaterHalfScreen,
      );
      control = Control.play;
    }
  }

  //
  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = DepthsToHorizonWaters.getMovie(
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
    WaterColorsAndStops.schedulingEveningWaterFullScreen,
  );

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
// the problem is the gradients aren't moving
// with it so you don't have that part of the
// perspectives
