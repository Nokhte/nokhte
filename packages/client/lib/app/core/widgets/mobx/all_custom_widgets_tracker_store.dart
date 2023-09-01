// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';

import '../beach_waves/beach_waves.dart';
import '../breathing_pentagons/breathing_pentagons.dart';
import '../fade_in_and_change_color_text/fade_in_and_change_color.dart';
import '../smart_fading_animated_text/smart_fading_animated_text.dart';
// * Mobx Codegen Inclusion
part 'all_custom_widgets_tracker_store.g.dart';

class AllCustomWidgetsTrackerStore = _AllCustomWidgetsTrackerStoreBase
    with _$AllCustomWidgetsTrackerStore;

abstract class _AllCustomWidgetsTrackerStoreBase extends Equatable with Store {
  final FadeInAndChangeColorTextStore fadeInAndChangeColorTextStore;
  final SmartFadingAnimatedTextTrackerStore smartFadingAnimatedTextStore;
  final BreathingPentagonsStateTrackerStore breathingPentagonsStore;
  final BeachWavesTrackerStore beachWavesStore;

  _AllCustomWidgetsTrackerStoreBase({
    required this.smartFadingAnimatedTextStore,
    required this.breathingPentagonsStore,
    required this.beachWavesStore,
    required this.fadeInAndChangeColorTextStore,
  });

  /// todo move these actions into a module specific extended class

  @action
  backToShoreWidgetChanges() {
    if (beachWavesStore.movieStatus == MovieStatus.idle &&
        beachWavesStore.movieMode == MovieModes.suspendedAtSea) {
      beachWavesStore.initiateBackToShore();
      breathingPentagonsStore.flipWidgetVisibility();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
  }

  @action
  toTheDepthsWidgetChanges() {
    if (beachWavesStore.movieStatus == MovieStatus.idle &&
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
