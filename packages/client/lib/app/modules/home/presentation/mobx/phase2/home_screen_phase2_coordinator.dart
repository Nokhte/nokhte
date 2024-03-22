// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'home_screen_phase2_coordinator.g.dart';

class HomeScreenPhase2Coordinator = _HomeScreenPhase2CoordinatorBase
    with _$HomeScreenPhase2Coordinator;

abstract class _HomeScreenPhase2CoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final HomeScreenPhase2WidgetsCoordinator widgets;
  _HomeScreenPhase2CoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
    required super.captureScreen,
    required super.tap,
  }) : super(widgets: widgets);

  @override
  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(Screens.homePhase2);
  }

  @override
  initReactors() {
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToVibrantBlueComplete: onShoreToVibrantBlueComplete,
      onVirginStorageEntry: () {},
      onSubsequentStorageEntry: () {},
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
    );
    super.initReactors();
    swipeReactor(
        onSwipeUp: () {
          setDisableAllTouchFeedback(true);
          widgets.onSwipeUp();
        },
        onSwipeRight: () {});
  }
}
