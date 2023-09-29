// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';

import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'widget_coordinator_store.g.dart';

class WidgetCoordinatorStore = _WidgetCoordinatorStoreBase
    with _$WidgetCoordinatorStore;

abstract class _WidgetCoordinatorStoreBase extends Equatable with Store {
  final FadeInAndChangeColorTextStore fadeInAndChangeColorTextStore;
  final SmartFadingAnimatedTextTrackerStore smartFadingAnimatedTextStore;
  final BreathingPentagonsStateTrackerStore breathingPentagonsStore;
  final BeachWavesTrackerStore beachWavesStore;

  _WidgetCoordinatorStoreBase({
    required this.smartFadingAnimatedTextStore,
    required this.breathingPentagonsStore,
    required this.beachWavesStore,
    required this.fadeInAndChangeColorTextStore,
  });

  /// todo move these actions into a module specific extended class

  @action
  backToShoreWidgetChanges() {
    if (beachWavesStore.movieStatus != MovieStatus.inProgress &&
        beachWavesStore.movieMode == MovieModes.suspendedAtSea) {
      beachWavesStore.initiateBackToShore();
      breathingPentagonsStore.flipWidgetVisibility();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
  }

  @action
  toTheDepthsWidgetChanges() {
    if (beachWavesStore.movieStatus != MovieStatus.inProgress &&
        beachWavesStore.movieMode == MovieModes.suspendedAtSea) {
      beachWavesStore.initiateToTheDepths();
      breathingPentagonsStore.flipWidgetVisibility();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
    //
  }

  @override
  List<Object> get props => [
// some items
      ];
}
