// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:simple_animations/simple_animations.dart';
// * Mobx Codegen Inclusion
part 'audio_clip_platform_tracker_store.g.dart';

class AudioClipPlatformTrackerStore = _AudioClipPlatformTrackerStoreBase
    with _$AudioClipPlatformTrackerStore;

abstract class _AudioClipPlatformTrackerStoreBase extends Equatable with Store {
  @observable
  bool showWidget = false;

  @observable
  MovieTween movie = MovieTween();

  @observable
  Control control = Control.play;

  @action
  void toggleWidgetVisibility() => showWidget = !showWidget;

  @override
  List<Object> get props => [];
}
