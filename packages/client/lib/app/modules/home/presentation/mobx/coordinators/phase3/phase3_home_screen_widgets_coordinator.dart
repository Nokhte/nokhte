// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_widgets_coordinator.dart';
import 'package:simple_animations/simple_animations.dart';
part 'phase3_home_screen_widgets_coordinator.g.dart';

class Phase3HomeScreenWidgetsCoordinator = _Phase3HomeScreenWidgetsCoordinatorBase
    with _$Phase3HomeScreenWidgetsCoordinator;

abstract class _Phase3HomeScreenWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _Phase3HomeScreenWidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
  });

  @observable
  bool gracePeriodHasExpired = false;

  @action
  constructor() {
    if (Modular.args.data["resumeOnShoreParams"] != null) {
      params = Modular.args.data["resumeOnShoreParams"];
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(Modular.args.data["resumeOnShoreParams"]);
    gestureCross.setHomeScreen();
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    initReactors();
  }

  @action
  @override
  initReactors() {
    super.initReactors();
    gestureCrossTapReactor();
  }

  @action
  onSwipeUp() => prepForNavigation(excludeUnBlur: !hasInitiatedBlur);

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
      gestureCross.stopBlinking();

      primarySmartText.setCurrentIndex(1);
      primarySmartText.startRotatingText();
    }
  }
}
