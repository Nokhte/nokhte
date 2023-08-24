// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/animation_status.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/movie_modes.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
import 'package:primala/app/core/widgets/breathing_pentagons/stack/presentation/mobx/main/breathing_pentagons_state_tracker_store.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';
// * Mobx Codegen Inclusion
part 'custom_widgets_tracker_store.g.dart';

class CustomWidgetsTrackerStore = _CustomWidgetsTrackerStoreBase
    with _$CustomWidgetsTrackerStore;

abstract class _CustomWidgetsTrackerStoreBase extends Equatable with Store {
  final SmartFadingAnimatedTextTrackerStore smartFadingAnimatedTextStore;
  final BreathingPentagonsStateTrackerStore breathingPentagonsStore;
  final BeachWavesTrackerStore beachWavesStore;

  _CustomWidgetsTrackerStoreBase({
    required this.smartFadingAnimatedTextStore,
    required this.breathingPentagonsStore,
    required this.beachWavesStore,
  });

  @action
  collaboratorPhraseSwipeDownCallback() {
    if (beachWavesStore.animationStatus == AnimationStatus.idle &&
        beachWavesStore.movieMode == MovieModes.oceanDive) {
      beachWavesStore.initiateBackToShore();
      breathingPentagonsStore.flipWidgetVisibility();
      smartFadingAnimatedTextStore.fadeTheTextOut();
    }
  }

  @override
  List<Object> get props => [
// some items
      ];
}
