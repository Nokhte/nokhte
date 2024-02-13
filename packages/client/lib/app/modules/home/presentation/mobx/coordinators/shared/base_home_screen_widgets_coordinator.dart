// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'base_home_screen_widgets_coordinator.g.dart';

class BaseHomeScreenWidgetsCoordinator = _BaseHomeScreenWidgetsCoordinatorBase
    with _$BaseHomeScreenWidgetsCoordinator;

abstract class _BaseHomeScreenWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;

  _BaseHomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
  });

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool hasSwipedUp = false;

  @action
  toggleHasSwipedUp() => hasSwipedUp = !hasSwipedUp;

  @action
  onConnected() {
    onResumed();
  }

  @action
  onDisconnected() {
    onInactive();
    if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToVibrantBlue) {
      isEnteringNokhteSession = false;
      beachWaves.currentStore.setControl(Control.playReverse);
    }
  }

  @action
  onResumed() {
    if (!hasInitiatedBlur) {
      primarySmartText.startRotatingText();
      if (hasInitiatedBlur) {
        nokhteBlur.reverse();
        toggleHasInitiatedBlur();
      }
    }
  }

  @action
  onInactive() {
    if (!hasInitiatedBlur) {
      primarySmartText.reset();
      if (!hasSwipedUp && beachWaves.movieMode == BeachWaveMovieModes.onShore) {
        beachWaves.currentStore.setControl(Control.mirror);
      }
    }
  }

  @action
  prepForNavigation({bool excludeUnBlur = false}) {
    toggleHasSwipedUp();
    if (!excludeUnBlur) {
      nokhteBlur.reverse();
    }
    gestureCross.stopBlinking();
    if (primarySmartText.currentIndex == 0) {
      primarySmartText.toggleWidgetVisibility();
    } else {
      primarySmartText.startRotatingText(isResuming: true);
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToOceanDive);
    beachWaves.currentStore.initMovie(beachWaves.currentAnimationValues.first);
    gestureCross.initMoveAndRegenerate(CircleOffsets.top);
  }

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool isDoubleTriggeringWindDown = false;

  @action
  toggleIsDoubleTriggeringWindDown() =>
      isDoubleTriggeringWindDown = !isDoubleTriggeringWindDown;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  initReactors() {
    nokhteBlurReactor();
    centerCrossNokhteReactor();
  }

  centerCrossNokhteReactor() =>
      reaction((p0) => gestureCross.centerCrossNokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          gestureCross.gradientNokhte.toggleWidgetVisibility();
          gestureCross.strokeCrossNokhte.toggleWidgetVisibility();
        }
      });

  @action
  onLongReconnected() {
    if (wifiDisconnectOverlay.movieMode ==
        WifiDisconnectMovieModes.removeTheCircle) {
      if (isDisconnected) setIsDisconnected(false);
      if (primarySmartText.isPaused) {
        primarySmartText.resume();
      }
      if (hasSwipedUp) {
        beachWaves.currentStore.setControl(Control.playFromStart);
        beachWaves.setMovieStatus(MovieStatus.inProgress);
      }
      if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToVibrantBlue) {
        isEnteringNokhteSession = true;
        beachWaves.currentStore.setControl(Control.playFromStart);
      }
    }
  }

  nokhteBlurReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            nokhteBlur.pastControl == Control.playReverseFromEnd) {}
      });

  beachWavesMovieStatusReactor(
    Function onShoreToOceanDiveComplete,
    Function onShoreToVibrantBlueComplete,
  ) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
            onShoreToOceanDiveComplete();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.onShoreToVibrantBlue) {
            if (isEnteringNokhteSession) {
              onShoreToVibrantBlueComplete();
            } else {
              beachWaves.setMovieStatus(MovieStatus.inProgress);
            }
          } else if (p0 == MovieStatus.finished &&
              beachWaves.movieMode == BeachWaveMovieModes.resumeOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
          }
        } else if (beachWaves.movieStatus == MovieStatus.finished &&
            isEnteringNokhteSession) {
          Modular.to.navigate('/collaboration/pool');
        }
      });

  @action
  onDeepLinkOpened() {
    isEnteringNokhteSession = true;
    primarySmartText.toggleWidgetVisibility();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
    beachWaves.currentStore.initMovie(
      beachWaves.currentAnimationValues.first,
    );
    gestureCross.toggleAll();
  }
}
