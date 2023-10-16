// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/utilities/utilities.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/data/sun_and_moon_positions.dart';
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
  selectTimeBasedMovie(DateTime date) => MiscAlgos.schedulingExecutor(
        inputDate: date,
        isAStartingValue: false,
        needsHourParam: true,
        needsStartingValueParam: false,
        duskCallback: initDuskCallback,
        morningCallback: initMorningCallback,
        dayCallback: initDayCallback,
        eveningCallback: initEveningCallback,
      );

  @action
  void initDuskCallback(int hour) {
    movie = PlaceTheSunOrMoon.getMovie(
        MoonColors.colors, SunAndMoonPositions.timeMap[hour]!);
    isTheMoon = true;
    control = Control.play;
  }

  @action
  void initMorningCallback(int hour) {
    movie = PlaceTheSunOrMoon.getMovie(
        SunColors.morning, SunAndMoonPositions.timeMap[hour]!);
    control = Control.play;
  }

  @action
  void initDayCallback(int hour) {
    movie = PlaceTheSunOrMoon.getMovie(
        SunColors.day, SunAndMoonPositions.timeMap[hour]!);
    control = Control.play;
  }

  @action
  void initEveningCallback(int hour) {
    movie = PlaceTheSunOrMoon.getMovie(
        SunColors.evening, SunAndMoonPositions.timeMap[hour]!);
    control = Control.play;
  }

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = PlaceTheSunOrMoon.getMovie(
    MoonColors.colors,
    SunAndMoonPositions.eightAM,
  );

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
