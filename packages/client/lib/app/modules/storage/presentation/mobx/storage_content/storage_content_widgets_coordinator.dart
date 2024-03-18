// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/movie_status.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'storage_content_widgets_coordinator.g.dart';

class StorageContentWidgetsCoordinator = _StorageContentWidgetsCoordinatorBase
    with _$StorageContentWidgetsCoordinator;

abstract class _StorageContentWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final GestureCrossStore gestureCross;
  final ContentCardStore contentCard;
  final SmartTextStore smartText;
  _StorageContentWidgetsCoordinatorBase({
    required super.wifiDisconnectOverlay,
    required this.beachWaves,
    required this.gestureCross,
    required this.smartText,
    required this.contentCard,
  });

  @action
  constructor() {
    contentCard.initFadeIn();
    smartText.setMessagesData(MessagesData.storageHeader);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.drySandToVibrantBlueGrad);
    gestureCross.fadeIn();
    gestureCross.cross.initStaticGlow();
    initReactors();
  }

  initReactors() {
    centerCrossNokhteReactor();
    beachWavesReactor();
  }

  @action
  onSwipeLeft() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToDrySand);
    beachWaves.currentStore.reverseMovie(NoParams());
    gestureCross.initMoveAndRegenerate(CircleOffsets.left);
    contentCard.setWidgetVisibility(false);
  }

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
        }
      });

  beachWavesReactor() =>
      reaction((p0) => beachWaves.currentStore.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate("/storage/", arguments: {
            "crossShouldGlowUp": false,
          });
        }
      });

  @action
  onSessionCardTapped() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToDrySand);
    beachWaves.currentStore.initMovie(NoParams());
    contentCard.setWidgetVisibility(false);
    smartText.setWidgetVisibility(false);
  }
}
