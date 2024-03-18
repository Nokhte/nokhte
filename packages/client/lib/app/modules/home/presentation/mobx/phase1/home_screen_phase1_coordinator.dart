// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'home_screen_phase1_coordinator.g.dart';

class HomeScreenPhase1Coordinator = _HomeScreenPhase1CoordinatorBase
    with _$HomeScreenPhase1Coordinator;

abstract class _HomeScreenPhase1CoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final HomeScreenPhase1WidgetsCoordinator widgets;
  _HomeScreenPhase1CoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
    required super.captureScreen,
  }) : super(widgets: widgets);

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(Screens.homePhase1);
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
        onSwipeUp: () {
          setDisableAllTouchFeedback(true);
          widgets.onSwipeUp();
        },
        onSwipeRight: () {});
    widgets.beachWavesMovieStatusReactor(
        onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
        onShoreToVibrantBlueComplete: onShoreToVibrantBlueComplete,
        onVirginStorageEntry: () {},
        onSubsequentStorageEntry: () {});
  }
}
