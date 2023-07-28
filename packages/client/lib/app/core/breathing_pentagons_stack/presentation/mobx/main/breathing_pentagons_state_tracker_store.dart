// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/breathing_pentagons_stack/constants/movies/movies.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'breathing_pentagons_state_tracker_store.g.dart';

class BreathingPentagonsStateTrackerStore = _BreathingPentagonsStateTrackerStoreBase
    with _$BreathingPentagonsStateTrackerStore;

abstract class _BreathingPentagonsStateTrackerStoreBase extends Equatable
    with Store {
  @observable
  MovieTween movie = AggressiveExpansion.movie;

  @observable
  int movieCount = 0;

  @observable
  String currentMovie = 'AGGRESSIVE EXPANSION';

  @observable
  Control controlType = Control.stop;

  @observable
  bool isExpansionDone = false;

  @observable
  bool areColorChangesDone = false;

  @action
  void expansionIsDone() {
    movieCount++;
    controlType = Control.loop;
    movie = InfiniteSpinner.movie;
  }

  @override
  List<Object> get props => [
// some items
      ];
}
