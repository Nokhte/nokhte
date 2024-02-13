// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_coordinator.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'phase1_home_screen_coordinator.g.dart';

class Phase1HomeScreenCoordinator = _Phase1HomeScreenCoordinatorBase
    with _$Phase1HomeScreenCoordinator;

abstract class _Phase1HomeScreenCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final Phase1HomeScreenWidgetsCoordinator widgets;
  _Phase1HomeScreenCoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
  }) : super(widgets: widgets);

  @action
  constructor() {
    widgets.constructor();
    initReactors();
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(widgets.onSwipeUp);
  }
}
