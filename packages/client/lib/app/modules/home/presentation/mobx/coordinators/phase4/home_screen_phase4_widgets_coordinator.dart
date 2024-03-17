// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_widgets_coordinator.dart';
part 'home_screen_phase4_widgets_coordinator.g.dart';

class HomeScreenPhase4WidgetsCoordinator = _HomeScreenPhase4WidgetsCoordinatorBase
    with _$HomeScreenPhase4WidgetsCoordinator;

abstract class _HomeScreenPhase4WidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _HomeScreenPhase4WidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
  });

  @observable
  bool gracePeriodHasExpired = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @action
  constructor() {
    if (Modular.args.data["resumeOnShoreParams"] != null) {
      params = Modular.args.data["resumeOnShoreParams"];
    }
    beachWaves.setMovieMode(BeachWaveMovieModes.resumeOnShore);
    beachWaves.currentStore.initMovie(params);
    gestureCross.fadeIn(initOutlineFadeIn: true);
    primarySmartText.setMessagesData(MessagesData.empty);
    initReactors();
  }

  @action
  @override
  initReactors() {
    super.initReactors();
  }

  @action
  onSwipeUp() => prepForNavigation(excludeUnBlur: !hasInitiatedBlur);

  @action
  onSwipeRight() {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToVibrantBlue);
    beachWaves.currentStore.initMovie(
      beachWaves.currentAnimationValues.first,
    );
    gestureCross.initMoveAndRegenerate(CircleOffsets.right);
    primarySmartText.setWidgetVisibility(false);
  }
}
