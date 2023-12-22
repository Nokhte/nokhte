// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'home_screen_widgets_coordinator.g.dart';

class HomeScreenWidgetsCoordinator = _HomeScreenWidgetsCoordinatorBase
    with _$HomeScreenWidgetsCoordinator;

abstract class _HomeScreenWidgetsCoordinatorBase extends Equatable with Store {
  final ClockModelCoordinator clockModelCoordinator;
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final SmartTextStore smartText;

  _HomeScreenWidgetsCoordinatorBase({
    required this.clockModelCoordinator,
    required this.nokhteBlur,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.smartText,
  });

  @action
  constructor() {
    smartText.setMessagesData(MessagesData.firstTimeHomeList);
    smartText.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    initReactors();
  }

  onConnected() => null;
  onDisconnected() => null;

  @observable
  bool hasInitiatedBlur = false;

  @action
  toggleHasInitiatedBlur() => hasInitiatedBlur = !hasInitiatedBlur;

  initReactors() {
    blurCompletionReactor();
    gestureCrossTapReactor();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
  }

  gestureCrossTapReactor() => reaction((p0) => gestureCross.tapCount, (p0) {
        if (!hasInitiatedBlur) {
          nokhteBlur.init();
          smartText.startRotatingText(isResuming: true);
          toggleHasInitiatedBlur();
        }
      });

  blurCompletionReactor() => reaction((p0) => nokhteBlur.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          Modular.to.navigate('/home/circle_explanation');
        }
      });

  @override
  List<Object> get props => [];
}
