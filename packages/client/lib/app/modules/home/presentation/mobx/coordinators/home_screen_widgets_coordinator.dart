// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'home_screen_widgets_coordinator.g.dart';

class HomeScreenWidgetsCoordinator = _HomeScreenWidgetsCoordinatorBase
    with _$HomeScreenWidgetsCoordinator;

abstract class _HomeScreenWidgetsCoordinatorBase extends Equatable with Store {
  final TimeAlignmentModelCoordinator timeModel;
  final CircleExplanationModelCoordinator circleModel;
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final SmartTextStore smartText;

  _HomeScreenWidgetsCoordinatorBase({
    required this.timeModel,
    required this.circleModel,
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.smartText,
  });

  @action
  constructor() {
    smartText.reset();
    if (!smartText.showWidget) smartText.toggleWidgetVisibility();
    smartText.setMessagesData(MessagesData.firstTimeHomeList);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    circleModel.constructor();
    initReactors();
  }

  @action
  onConnected() {
    if (isDisconnected) toggleIsDisconnected();
  }

  @action
  onDisconnected() {
    if (!isDisconnected) toggleIsDisconnected();
  }

  @observable
  bool hasInitiatedBlur = false;

  @observable
  bool isDisconnected = false;

  @action
  toggleIsDisconnected() => isDisconnected = !isDisconnected;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  initReactors() {
    blurCompletionReactor();
    gestureCrossTapReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
    circleModelCompletionReactor();
  }

  gestureCrossTapReactor() => reaction((p0) => gestureCross.tapCount, (p0) {
        if (!isDisconnected) {
          if (!hasInitiatedBlur) {
            nokhteBlur.init();
            smartText.startRotatingText(isResuming: true);
            toggleHasInitiatedBlur();
          }
        }
      });

  blurCompletionReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          circleModel.initExplanation();
        }
      });

  circleModelCompletionReactor() =>
      reaction((p0) => circleModel.hasCompletedExplanation, (p0) {
        if (p0) {
          timeModel.init();
        }
      });

  @override
  List<Object> get props => [];
}
