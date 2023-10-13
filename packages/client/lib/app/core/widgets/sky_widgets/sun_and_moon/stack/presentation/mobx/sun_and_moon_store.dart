// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/data/sun_and_moon_times_and_positions.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/movies/place_the_sun_or_moon.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'sun_and_moon_store.g.dart';

class SunAndMoonStore = _SunAndMoonStoreBase with _$SunAndMoonStore;

abstract class _SunAndMoonStoreBase extends Equatable with Store {
  @observable
  bool isTheMoon = false;

  @action
  selectTimeBasedMovie(DateTime date) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      print("dusk");
      // Branch 1: Time is between 9 PM and 5:59 AM
      movie = PlaceTheSunOrMoon.getMovie(
          MoonColors.colors, SunAndMoonTimesAndPositions.timeMap[hour]!);
      isTheMoon = true;
      control = Control.play;
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      movie = PlaceTheSunOrMoon.getMovie(
          SunColors.morning, SunAndMoonTimesAndPositions.timeMap[hour]!);
      control = Control.play;
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      movie = PlaceTheSunOrMoon.getMovie(
          SunColors.day, SunAndMoonTimesAndPositions.timeMap[hour]!);
      control = Control.play;
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      movie = PlaceTheSunOrMoon.getMovie(
          SunColors.evening, SunAndMoonTimesAndPositions.timeMap[hour]!);
      control = Control.play;
    }
  }

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = PlaceTheSunOrMoon.getMovie(
    MoonColors.colors,
    SunAndMoonTimesAndPositions.eightAM,
  );

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
