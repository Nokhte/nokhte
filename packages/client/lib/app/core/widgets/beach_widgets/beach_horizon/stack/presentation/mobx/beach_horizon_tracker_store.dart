// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../movies/movies.dart';
// * Mobx Codegen Inclusion
part 'beach_horizon_tracker_store.g.dart';

class BeachHorizonTrackerStore = _BeachHorizonTrackerStoreBase
    with _$BeachHorizonTrackerStore;

abstract class _BeachHorizonTrackerStoreBase extends Equatable with Store {
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