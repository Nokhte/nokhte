// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/sky_widgets/beach_sky/stack/constants/movie/movie.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'beach_sky_store.g.dart';

class BeachSkyStore = _BeachSkyStoreBase with _$BeachSkyStore;

abstract class _BeachSkyStoreBase extends Equatable with Store {
  @observable
  MovieTween movie = RevealTheSky.movie;

  @observable
  Control control = Control.play;

  @override
  List<Object> get props => [];
}
