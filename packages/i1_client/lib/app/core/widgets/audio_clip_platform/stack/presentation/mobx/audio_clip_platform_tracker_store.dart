// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'audio_clip_platform_tracker_store.g.dart';

class AudioClipPlatformTrackerStore = _AudioClipPlatformTrackerStoreBase
    with _$AudioClipPlatformTrackerStore;

abstract class _AudioClipPlatformTrackerStoreBase
    extends BaseCustomAnimatedWidgetStore with Store {
  _AudioClipPlatformTrackerStoreBase() {
    showWidget = false;
    movie = AudioClipPlatformColorAndVertOffsetChange.getMovie(
      startingCircleColors: PerspectivesMapAnimationData.getWhiteArr(0),
      endingCircleColors: PerspectivesMapAnimationData.getWhiteArr(0),
      startingVertOffsets: List.filled(3, 0.0),
      endingVertOffsets: List.filled(3, 0.0),
    );
    control = Control.play;
  }
}
