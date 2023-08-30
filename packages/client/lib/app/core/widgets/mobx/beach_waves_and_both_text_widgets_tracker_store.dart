// ignore_for_file: must_be_immutable, library_private_types_in_public_api

// * Mobx Import
import 'package:mobx/mobx.dart';
import '../beach_waves/beach_waves.dart';
import '../fade_in_and_change_color_text/fade_in_and_change_color.dart';
import '../smart_fading_animated_text/smart_fading_animated_text.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
// * Mobx Codegen Inclusion
part 'beach_waves_and_both_text_widgets_tracker_store.g.dart';

class BeachWavesAndBothTextWidgetsTrackerStore = _BeachWavesAndBothTextWidgetsTrackerStoreBase
    with _$BeachWavesAndBothTextWidgetsTrackerStore;

abstract class _BeachWavesAndBothTextWidgetsTrackerStoreBase extends Equatable
    with Store {
  final SmartFadingAnimatedTextTrackerStore smartFadingAnimatedTextStore;
  final FadeInAndChangeColorTextStore fadeInAndChangeColorTextStore;
  final BeachWavesTrackerStore beachWavesStore;
  _BeachWavesAndBothTextWidgetsTrackerStoreBase({
    required this.beachWavesStore,
    required this.smartFadingAnimatedTextStore,
    required this.fadeInAndChangeColorTextStore,
  });
  @override
  List<Object> get props => [
// some items
      ];
}
