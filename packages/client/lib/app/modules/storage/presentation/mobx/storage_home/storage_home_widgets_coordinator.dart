// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'storage_home_widgets_coordinator.g.dart';

class StorageHomeWidgetsCoordinator = _StorageHomeWidgetsCoordinatorBase
    with _$StorageHomeWidgetsCoordinator;

abstract class _StorageHomeWidgetsCoordinatorBase extends BaseWidgetsCoordinator
    with Store {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final SessionCardStore sessionCard;
  final SmartTextStore smartText;
  _StorageHomeWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
    required this.smartText,
    required this.sessionCard,
  });

  @action
  constructor() {
    sessionCard.initFadeIn();
    smartText.setMessagesData(MessagesData.storageHeader);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    initReactors();
  }

  initReactors() {
    centerCrossNokhteReactor();
  }

  @action
  onSwipeLeft() {
    smartText.setWidgetVisibility(false);
    beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
    beachWaves.currentStore.initMovie(const AnyToOnShoreParams(
      startingColors: WaterColorsAndStops.vibrantBlueGrad,
    ));
    gestureCross.cross.initOutlineFadeOut();
    gestureCross.initMoveAndRegenerate(CircleOffsets.left);
    sessionCard.setWidgetVisibility(false);
  }

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
        }
      });

  @action
  onSessionCardTapped() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToDrySand);
    beachWaves.currentStore.initMovie(NoParams());
    sessionCard.setWidgetVisibility(false);
    smartText.setWidgetVisibility(false);
    gestureCross.gradientNokhte.toggleWidgetVisibility();
    gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
  }

  @action
  dispose() {
    sessionCard.dispose();
  }
}
