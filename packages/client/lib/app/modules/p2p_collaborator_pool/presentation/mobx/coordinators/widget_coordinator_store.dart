// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/beach_widgets/shared/types/types.dart';

import 'package:primala/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'widget_coordinator_store.g.dart';

class WidgetCoordinatorStore = _WidgetCoordinatorStoreBase
    with _$WidgetCoordinatorStore;

abstract class _WidgetCoordinatorStoreBase extends Equatable with Store {
  final MeshCircleButtonStore meshCircleButtonStore;
  final FadeInAndChangeColorTextStore fadeInAndChangeColorTextStore;
  final SmartFadingAnimatedTextTrackerStore smartFadingAnimatedTextStore;
  final BeachWavesTrackerStore beachWavesStore;

  _WidgetCoordinatorStoreBase({
    required this.meshCircleButtonStore,
    required this.smartFadingAnimatedTextStore,
    required this.beachWavesStore,
    required this.fadeInAndChangeColorTextStore,
  });

  @action
  backToShoreWidgetChanges() {
    if (beachWavesStore.movieStatus != MovieStatus.inProgress &&
        beachWavesStore.movieMode == MovieModes.suspendedAtSea) {
      beachWavesStore.initiateBackToShore();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
  }

  @action
  toTheDepthsWidgetChanges() {
    if (beachWavesStore.movieStatus != MovieStatus.inProgress &&
        beachWavesStore.movieMode == MovieModes.suspendedAtSea) {
      beachWavesStore.initiateToTheDepths();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
    //
  }

  @override
  List<Object> get props => [
// some items
      ];
}
