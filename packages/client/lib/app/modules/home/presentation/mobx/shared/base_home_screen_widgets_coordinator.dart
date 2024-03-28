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
  final GestureCrossStore gestureCross;
  final SmartTextStore primarySmartText;
  final SmartTextStore errorSmartText;
  final SmartTextStore secondaryErrorSmartText;

  _BaseHomeScreenWidgetsCoordinatorBase({
    required this.nokhteBlur,
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.primarySmartText,
    required this.errorSmartText,
    required this.secondaryErrorSmartText,
  });

  @action
  constructor() {
    if (Modular.args.data["resumeOnShoreParams"] != null) {
      params = Modular.args.data["resumeOnShoreParams"];
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(Modular.args.data["resumeOnShoreParams"]);
    gestureCross.fadeIn();
    errorSmartText.setMessagesData(MessagesData.empty);
    secondaryErrorSmartText.setMessagesData(MessagesData.errorConfirmList);
  }

  @observable
  bool isInErrorMode = false;

  @action
  setIsInErrorMode(bool value) => isInErrorMode = value;

  @observable
  bool isEnteringNokhteSession = false;

  @observable
  bool hasSwipedUp = false;

  @observable
  ResumeOnShoreParams params = ResumeOnShoreParams.initial();

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
    if (!hasSwipedUp) {
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
      beachWaves.currentStore
          .initMovie(beachWaves.currentAnimationValues.first);
      gestureCross.initMoveAndRegenerate(CircleOffsets.top);
    }
  }

  @action
  onError(String errorMessage) {
    nokhteBlur.reset();
    errorSmartText.reset();
    secondaryErrorSmartText.reset();
    errorSmartText.setMessagesData(MessagesData.getErrorList(errorMessage));
    secondaryErrorSmartText.setMessagesData(MessagesData.errorConfirmList);
    errorSmartText.startRotatingText();
    secondaryErrorSmartText.startRotatingText();
    nokhteBlur.init();
    setIsInErrorMode(true);
  }

  @action
  onErrorResolved() {
    if (isInErrorMode) {
      if (beachWaves.movieStatus == MovieStatus.finished) {
        beachWaves.setMovieMode(BeachWaveMovieModes.anyToOnShore);
        beachWaves.currentStore.initMovie(beachWaves.currentColorsAndStops);
        beachWaves.setMovieStatus(MovieStatus.inProgress);
        nokhteBlur.reverse();
        gestureCross.fadeInTheCross();
        gestureCross.fadeIn();
        errorSmartText.setWidgetVisibility(false);
        secondaryErrorSmartText.setWidgetVisibility(false);
        isEnteringNokhteSession = false;
      }
    }
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

  beachWavesMovieStatusReactor({
    required Function onShoreToOceanDiveComplete,
    required Function onShoreToVibrantBlueComplete,
    required Function onVirginStorageEntry,
    required Function onSubsequentStorageEntry,
    required Function onAnyToShoreComplete,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (beachWaves.movieMode == BeachWaveMovieModes.onShoreToOceanDive) {
            onShoreToOceanDiveComplete();
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.onShoreToVibrantBlue) {
            if (isEnteringNokhteSession) {
              if (!isInErrorMode) {
                onShoreToVibrantBlueComplete();
              }
            } else {
              onSubsequentStorageEntry();
            }
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.resumeOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
          } else if (beachWaves.movieMode ==
              BeachWaveMovieModes.onShoreToDrySand) {
            onVirginStorageEntry();
          } else if (beachWaves.movieMode == BeachWaveMovieModes.anyToOnShore) {
            beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
            beachWaves.currentStore.initMovie(ResumeOnShoreParams.initial());
            onAnyToShoreComplete();
            setIsInErrorMode(false);
          }
        }
      });

  @observable
  int onCompleteCount = 0;

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
