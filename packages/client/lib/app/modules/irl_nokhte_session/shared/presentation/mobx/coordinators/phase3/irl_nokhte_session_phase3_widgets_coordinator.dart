// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/irl_nokhte_session/irl_nokhte_session.dart';
part 'irl_nokhte_session_phase3_widgets_coordinator.g.dart';

class IrlNokhteSessionPhase3WidgetsCoordinator = _IrlNokhteSessionPhase3WidgetsCoordinatorBase
    with _$IrlNokhteSessionPhase3WidgetsCoordinator;

abstract class _IrlNokhteSessionPhase3WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  final SmartTextStore primarySmartText;
  final SmartTextStore secondarySmartText;
  final SmartTextStore tertiarySmartText;
  final GestureCrossStore gestureCross;

  _IrlNokhteSessionPhase3WidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
    required this.primarySmartText,
    required this.secondarySmartText,
    required this.tertiarySmartText,
    required this.gestureCross,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(
      BeachWaveMovieModes.vibrantBlueGradientToTimesUp,
    );
    primarySmartText.setMessagesData(
      MessagesData.nokhteSessionExitScreenTopText,
    );
    secondarySmartText.setMessagesData(
      MessagesData.nokhteSessionExitScreenBottom,
    );
    tertiarySmartText.setMessagesData(
      MessagesData.nokhteSessionExitWaiting,
    );
    primarySmartText.startRotatingText();
    secondarySmartText.startRotatingText();
  }

  @action
  onReadyToGoHome() {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
    beachWaves.currentStore.reverseMovie(NoParams());
    tertiarySmartText.setWidgetVisibility(false);
    gestureCross.fadeInTheCross();
  }

  @action
  onSwipeUp() {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    tertiarySmartText.startRotatingText();
  }

  @action
  onReadyToGoBack(IrlNokhteSessionPhoneRole phoneRole) {
    primarySmartText.setWidgetVisibility(false);
    secondarySmartText.setWidgetVisibility(false);
    if (phoneRole == IrlNokhteSessionPhoneRole.talking) {
      beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf);
      beachWaves.currentStore.initMovie(NoParams());
    } else if (phoneRole == IrlNokhteSessionPhoneRole.notes) {
      Future.delayed(Seconds.get(1), () {
        Modular.to.navigate('/irl_nokhte_session/notes');
      });
    }
  }

  beachWavesMovieStatusReactor({
    required Function onToHomeComplete,
    required Function onReturnToTalkingComplete,
  }) =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.onShoreToVibrantBlue) {
          onToHomeComplete();
        } else if (p0 == MovieStatus.finished &&
            beachWaves.movieMode ==
                BeachWaveMovieModes.vibrantBlueGradToHalfAndHalf) {
          onReturnToTalkingComplete();
        }
      });
}
