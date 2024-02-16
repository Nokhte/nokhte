// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_coordinator.dart';
import 'home_screen_phase3_widgets_coordinator.dart';
part 'home_screen_phase3_coordinator.g.dart';

class HomeScreenPhase3Coordinator = _HomeScreenPhase3CoordinatorBase
    with _$HomeScreenPhase3Coordinator;

abstract class _HomeScreenPhase3CoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final HomeScreenPhase3WidgetsCoordinator widgets;

  _HomeScreenPhase3CoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required super.deepLinks,
    required this.widgets,
    required super.captureScreen,
  }) : super(widgets: widgets);

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(Screens.homePhase3);
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(widgets.onSwipeUp);
  }
}
