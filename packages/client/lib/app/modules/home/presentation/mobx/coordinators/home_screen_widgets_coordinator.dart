// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'home_screen_widgets_coordinator.g.dart';

class HomeScreenWidgetsCoordinator = _HomeScreenWidgetsCoordinatorBase
    with _$HomeScreenWidgetsCoordinator;

abstract class _HomeScreenWidgetsCoordinatorBase extends Equatable with Store {
  final ClockFaceStore clockFace;
  final GradientCircleStore gradientCircle;
  final SpotlightHaloStore spotlightHalo;
  final NokhteBlurStore nokhteBlur;
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final GestureCrossStore gestureCross;
  final SmartTextStore smartText;

  _HomeScreenWidgetsCoordinatorBase({
    required this.clockFace,
    required this.nokhteBlur,
    required this.gradientCircle,
    required this.spotlightHalo,
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.gestureCross,
    required this.smartText,
  });

  @action
  constructor() {
    smartText.setMessagesData(MessagesData.firstTimeHomeList);
    smartText.startRotatingText();
    nokhteBlur.init();
    beachWaves.setMovieMode(BeachWaveMovieModes.onShore);
    spotlightHalo.toggleWidgetVisibility();
    wifiDisconnectOverlay.connectionReactor(
      onConnected: onConnected,
      onDisconnected: onDisconnected,
    );
  }

  onConnected() => null;
  onDisconnected() => null;

  @override
  List<Object> get props => [];
}
