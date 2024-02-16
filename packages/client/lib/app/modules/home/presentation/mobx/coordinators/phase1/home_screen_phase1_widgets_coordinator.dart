// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_widgets_coordinator.dart';
import 'package:simple_animations/simple_animations.dart';
part 'home_screen_phase1_widgets_coordinator.g.dart';

class HomeScreenPhase1WidgetsCoordinator = _HomeScreenPhase1WidgetsCoordinatorBase
    with _$HomeScreenPhase1WidgetsCoordinator;

abstract class _HomeScreenPhase1WidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _HomeScreenPhase1WidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
  });

  @action
  constructor() {
    if (Modular.args.data["resumeOnShoreParams"] != null) {
      params = Modular.args.data["resumeOnShoreParams"];
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(Modular.args.data["resumeOnShoreParams"]);
    gestureCross.setHomeScreen();
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  @override
  initReactors() {
    gestureCrossTapReactor();
    super.initReactors();
  }

  @action
  onSwipeUp() {
    if (primarySmartText.currentIndex.equals(1)) {
      prepForNavigation();
    }
  }

  gestureCrossTapReactor() => reaction(
        (p0) => gestureCross.tapCount,
        (p0) => onGestureCrossTap(),
      );

  @action
  onGestureCrossTap() {
    if (!hasInitiatedBlur && !isEnteringNokhteSession) {
      nokhteBlur.init();
      beachWaves.currentStore.setControl(Control.stop);
      toggleHasInitiatedBlur();
      primarySmartText.startRotatingText(isResuming: true);
    }
  }
}
