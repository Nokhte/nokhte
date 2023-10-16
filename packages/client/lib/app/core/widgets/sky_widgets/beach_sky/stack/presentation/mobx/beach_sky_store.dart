// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/utilities/misc_algos.dart';
import 'package:primala/app/core/widgets/sky_widgets/beach_sky/stack/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'beach_sky_store.g.dart';

class BeachSkyStore = _BeachSkyStoreBase with _$BeachSkyStore;

abstract class _BeachSkyStoreBase extends Equatable with Store {
  @action
  selectTimeBasedMovie(DateTime date) => MiscAlgos.schedulingExecutor(
        inputDate: date,
        needsHourParam: false,
        duskCallback: initDuskCallback,
        morningCallback: initMorningCallback,
        dayCallback: initDayCallback,
        eveningCallback: initEveningCallback,
      );

  @action
  void initDuskCallback() {
    movie = RevealTheSky.getMovie(SkyColors.dusk);
    control = Control.play;
  }

  @action
  void initDayCallback() {
    movie = RevealTheSky.getMovie(SkyColors.day);
    control = Control.play;
  }

  @action
  void initMorningCallback() {
    movie = RevealTheSky.getMovie(SkyColors.morning);
    control = Control.play;
  }

  @action
  void initEveningCallback() {
    movie = RevealTheSky.getMovie(SkyColors.evening);
    control = Control.play;
  }

  @action
  initForwardShift(DateTime pastTime, DateTime newTime) {}

  @action
  initBackwardsShift(DateTime pastTime, DateTime newTime) {}

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = RevealTheSky.getMovie(SkyColors.evening);

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
