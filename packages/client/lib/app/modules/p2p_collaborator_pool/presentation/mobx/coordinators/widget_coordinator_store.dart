// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
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
        beachWavesStore.movieMode == BeachWaveMovieModes.suspendedAtSea) {
      beachWavesStore.initiateBackToShore();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
  }

  @action
  toTheDepthsWidgetChanges() {
    if (beachWavesStore.movieStatus != MovieStatus.inProgress &&
        beachWavesStore.movieMode == BeachWaveMovieModes.suspendedAtSea) {
      beachWavesStore.initiateToTheDepths();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
  }

  @override
  List<Object> get props => [];
}
