// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'storage_home_widgets_coordinator.g.dart';

class StorageHomeWidgetsCoordinator = _StorageHomeWidgetsCoordinatorBase
    with _$StorageHomeWidgetsCoordinator;

abstract class _StorageHomeWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  _StorageHomeWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    gestureCross.fadeIn(initOutlineFadeIn: true);
    centerCrossNokhteReactor();
  }

  @action
  onSwipeLeft() {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
    beachWaves.currentStore.reverseMovie(NoParams());
    gestureCross.initMoveAndRegenerate(CircleOffsets.left);
    gestureCross.cross.initOutlineFadeOut();
  }

  beachWavesMovieStatusReactor(Function onHomeAnimationComplete) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.onShoreToVibrantBlue) {
          onHomeAnimationComplete();
        }
      });

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
        }
      });
}
