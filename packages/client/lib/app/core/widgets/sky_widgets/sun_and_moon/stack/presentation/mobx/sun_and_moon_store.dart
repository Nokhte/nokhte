// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/sky_widgets/sun_and_moon/stack/constants/movies/place_the_sun_or_moon.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'sun_and_moon_store.g.dart';

class SunAndMoonStore = _SunAndMoonStoreBase with _$SunAndMoonStore;

abstract class _SunAndMoonStoreBase extends Equatable with Store {
  @observable
  MovieTween movie = PlaceTheSunOrMoon.movie();

  @observable
  Control control = Control.play;

  @override
  List<Object> get props => [];
}
