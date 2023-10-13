// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/sky_widgets/beach_sky/stack/constants/constants.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'beach_sky_store.g.dart';

class BeachSkyStore = _BeachSkyStoreBase with _$BeachSkyStore;

abstract class _BeachSkyStoreBase extends Equatable with Store {
  @action
  selectTimeBasedMovie(DateTime date) {
    final hour = date.hour;
    if (hour >= 21 || hour < 6) {
      // Branch 1: Time is between 9 PM and 5:59 AM
      movie = RevealTheSky.getMovie(SkyColors.dusk);
      control = Control.play;
      // setControl(Control.playFromStart);
    } else if (hour >= 6 && hour < 10) {
      // Branch 2: Time is between 6 AM and 9:59 AM
      movie = RevealTheSky.getMovie(SkyColors.morning);
      control = Control.play;
      // setControl(Control.playFromStart);
    } else if (hour >= 10 && hour < 17) {
      // Branch 3: Time is between 10 AM and 4:59 PM
      movie = RevealTheSky.getMovie(SkyColors.day);
      control = Control.play;
      // setControl(Control.playFromStart);
    } else {
      // Branch 4: Time is between 5 PM and 8:59 PM
      movie = RevealTheSky.getMovie(SkyColors.evening);
      control = Control.play;
      // setControl(Control.playFromStart);
    }
  }

  void setControl(Control newControl) => control = newControl;

  @observable
  MovieTween movie = RevealTheSky.getMovie(SkyColors.evening);

  @observable
  Control control = Control.stop;

  @override
  List<Object> get props => [];
}
