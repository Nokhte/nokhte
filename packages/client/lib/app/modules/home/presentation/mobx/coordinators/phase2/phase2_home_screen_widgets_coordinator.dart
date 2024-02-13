// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_widgets_coordinator.dart';
import 'package:simple_animations/simple_animations.dart';
part 'phase2_home_screen_widgets_coordinator.g.dart';

class Phase2HomeScreenWidgetsCoordinator = _Phase2HomeScreenWidgetsCoordinatorBase
    with _$Phase2HomeScreenWidgetsCoordinator;

abstract class _Phase2HomeScreenWidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _Phase2HomeScreenWidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
  });

  @observable
  bool gracePeriodHasExpired = false;

  @observable
  bool crossHasBeenTapped = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @observable
  ResumeOnShoreParams params = ResumeOnShoreParams.initial();

  @action
  constructor() {
    if (Modular.args.data["resumeOnShoreParams"] != null) {
      params = Modular.args.data["resumeOnShoreParams"];
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(Modular.args.data["resumeOnShoreParams"]);
    primarySmartText.setMessagesData(MessagesData.firstTimeHomeList);
    gestureCross.setHomeScreen();
    Future.delayed(Seconds.get(3), () {
      if (!hasSwipedUp) {
        gestureCross.startBlinking();
        primarySmartText.startRotatingText();
        toggleGracePeriodHasExpired();
      }
    });
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
    if (!hasSwipedUp) {
      toggleHasSwipedUp();
      prepForNavigation(excludeUnBlur: !hasSwipedUp);
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
      gestureCross.stopBlinking();
      if (gracePeriodHasExpired) {
        primarySmartText.startRotatingText(isResuming: true);
      } else {
        primarySmartText.setCurrentIndex(1);
        primarySmartText.startRotatingText();
      }
    }
  }
}
